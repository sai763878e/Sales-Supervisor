import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/data/repositories/remote/authentication/president_dashboard/president_dashboard_repository.dart';
import 'package:sales_supervisor/features/authentication/models/login/user_pref.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/dashboard_component_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_component_model.dart';
import 'package:sales_supervisor/features/president_dashboard/models/dashboard_report_ids.dart';
import 'package:sales_supervisor/features/president_dashboard/models/location_filter_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:uuid/uuid.dart';

import '../../../data/repositories/remote/api_client/api_service.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/language/app_language_utils.dart';

class PresidentMyDashboardController extends GetxController {
  static PresidentMyDashboardController get instance => Get.find();

  String userTypeId = "",
      userId = "",
      locationFilterUID = "",
      filterOptionBase = "MTD-LY";
  int filterOptionMonth = 0, filterOptionYear = 0;

  int dashboardComponentInstances = 0;

  PresidentDashboardRepository presidentDashboardRepository =
      PresidentDashboardRepository.instance;

  final dashComponentsList =
      <DashboardReportIds, List<Rx<DashboardComponentModel>>>{}.obs;
  final isPageLoading = true.obs;
  final isPageRefreshing = false.obs;
  final isLocationFilterLoading = true.obs;

  final locationFilterMap = <String, List<FilterDatum>>{}.obs;
  final locationTypesList = <LocationTypesModel>[].obs;
  final locationFilterSelected = "".obs;

  @override
  Future<void> onInit() async {
    if (UserPref.i.getUserData()?.User_Type != null) {
      userTypeId = UserPref.i.getUserData()!.User_Type.toString();
    }
    if (UserPref.i.getUserData()?.User_Id != null) {
      userId = UserPref.i.getUserData()!.User_Id.toString();
    }
    locationFilterUID = "";
    filterOptionBase = "MTD-LY";

    DateTime dateTime = DateTime.now();
    filterOptionMonth = dateTime.month;
    filterOptionYear = dateTime.year;

    initializeDashboard();
    loadLocationFilters();
    super.onInit();
  }

  Future<void> initializeDashboard() async {
    await prepareDashboardData();
    // loadDashboard();
  }

  prepareDashboardData() async {
    var list = getGraphDashboard();
    for (DashboardReportIds type in list) {
      List<Rx<DashboardComponentModel>> dashboardList = [];
      Rx<DashboardComponentModel> dashboardComponentModel =
          DashboardComponentModel(
        type: type,
      ).obs;

      dashboardComponentModel.value.reportId = type.name.split("_")[0];
      dashboardComponentModel.value.reportWindowId = type.name.split("_")[1];
      dashboardComponentModel.value.isLoading = true;
      dashboardComponentModel.value.response = null;
      dashboardComponentModel.value.uuid = Uuid().v1();

      dashboardComponentModel.value.userId = userId;
      dashboardComponentModel.value.userTypeId = userTypeId;
      dashboardComponentModel.value.filterOptionBase = filterOptionBase;
      dashboardComponentModel.value.filterOptionMonth = '$filterOptionMonth';
      dashboardComponentModel.value.filterOptionYear = '$filterOptionYear';
      dashboardComponentModel.value.locationFilterUID = locationFilterUID;

      dashboardList.add(dashboardComponentModel);

      // dashComponentsList.assign(type, dashboardComponentModel);
      dashComponentsList.addIf(true, type, dashboardList);
    }

    isPageLoading.value = false;
    isPageLoading.refresh();
  }

  openLocationFilter(String value) async {
    try {} catch (e) {
    } finally {}
  }

  loadLocationFilters() async {
    try {
      isLocationFilterLoading.value = true;

      presidentDashboardRepository
          .getLocationFilters(userId: userId, userTypeId: userTypeId)
          .then((value) {
        if (value.filterData.isNotEmpty) {
          for (var location in value.filterData) {
            String key = location.type;

            locationFilterMap.putIfAbsent(key, () => []).add(location);
          }
          for (String key in locationFilterMap.keys) {
            locationTypesList
                .add(LocationTypesModel(type: key, isSelected: false));
          }

          dashComponentsList.forEach((key, value) {
            for (var ele in value) {
              // ele.value.locationFilterMap = locationFilterMap;
              ele.value.locationFilterMap = cloneLocationFilterMap(locationFilterMap);

            }
          });
        }

        if (locationFilterSelected.value.isEmpty &&
            locationTypesList.isNotEmpty) {
          locationTypesList[0].isSelected = true;
          locationFilterSelected.value = locationTypesList[0].type;
        }

        isLocationFilterLoading.value = false;
        isLocationFilterLoading.refresh();
      });
    } catch (e) {
    } finally {
      isLocationFilterLoading.value = false;
      isLocationFilterLoading.refresh();
    }
  }

  submitLocationFilter(RxMap<String, List<FilterDatum>> locationFilterMapOne) async {
    try {
      isPageLoading.value = true;
      isPageLoading.refresh();

      //json = {"Zone":[],"State":[]}
      Map<String, dynamic> json = {};
      locationFilterMapOne.forEach((key, value) {
        List<dynamic> selectedList = [];
        for (var element in value) {
          if (element.isSelected == 1) selectedList.add(element.id);
        }
        json.addIf(true, key, selectedList);
      });

      await presidentDashboardRepository
          .postLocationFilters(data1: json)
          .then((value) {
        if (value != null && value.isNotEmpty) {
          locationFilterUID = value;
        }

        dashComponentsList.forEach((key, value) {
          if (value.isNotEmpty) {
            for (var ele in value) {
              ele.value.isLoading = true;
              ele.value.locationFilterUID = locationFilterUID;
              ele.value.locationFilterMap = cloneLocationFilterMap(locationFilterMapOne);

            }
          }
        });
      });

    } catch (e) {
    } finally {
      isPageLoading.value = false;
      isPageLoading.refresh();
    }
  }

  RxMap<String, List<FilterDatum>> cloneLocationFilterMap(RxMap<String, List<FilterDatum>> original) {
    // Create a new map and clone the values inside it
    var clonedMap = <String, List<FilterDatum>>{}.obs;

    original.forEach((key, valueList) {
      // Clone each list and its contents (deep copy)
      clonedMap[key] = valueList.map((filterDatum) => filterDatum.clone()).toList();
    });

    return clonedMap;
  }

  submitComponentLocationFilter(RxMap<String, List<FilterDatum>> locationFilterMapOne, DashboardComponentController? controller) async {
    try {
      controller?.submitComponentLocationFilter(locationFilterMapOne);
    } catch (e) {
    } finally {
    }
  }


  showLocationFilterSheet(BuildContext context, bool isDark, RxMap<String, List<FilterDatum>> locationFilterMapOne,bool isGlobalFilter, DashboardComponentController? controller) {
    Get.bottomSheet(
        ignoreSafeArea: true,
        barrierColor: Colors.transparent.withValues(alpha: 0.3),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(CSizes.borderRadiusXLg),
            topRight: Radius.circular(CSizes.borderRadiusXLg),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        isScrollControlled: true,
        // Allow full height

        backgroundColor:
            isDark ? CColors.darkContainer : CColors.lightContainer,
        Container(
          height: CHelperFunction.screenHeight() * 0.8,
          width: double.infinity,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              AppLanguageUtils.instance.filter,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 18),
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: double.infinity,
                      color: Colors.grey.shade300,
                      child: Obx(
                        () => ListView.builder(
                            itemCount: locationTypesList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              LocationTypesModel locationType =
                                  locationTypesList[index];
                              return GestureDetector(
                                onTap: () {
                                  for (var ele in locationTypesList) {
                                    ele.isSelected = false;
                                  }

                                  locationTypesList[index].isSelected = true;
                                  locationTypesList.refresh();
                                  locationFilterSelected.value =
                                      locationType.type;
                                  locationFilterSelected.refresh();
                                },
                                child: Container(
                                  color: locationType.isSelected
                                      ? CColors.white
                                      : Colors.grey.shade300,
                                  child: Padding(
                                      padding: EdgeInsets.all(CSizes.xmd),
                                      child:
                                          Text(locationTypesList[index].type)),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        color: Colors.grey.shade300,
                        child: Obx(
                          () => ListView.builder(
                              itemCount: locationFilterMapOne[
                                      locationFilterSelected.value]
                                  ?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                FilterDatum locationType = locationFilterMapOne[
                                    locationFilterSelected.value]![index];
                                return Container(
                                  // color: locationType.isSelected ? CColors.white : Colors.grey.shade300,
                                  child: Padding(
                                      padding: EdgeInsets.all(0),
                                      child: GestureDetector(
                                        onTap: () {
                                          if (locationType.isSelected == 1) {
                                            locationType.isSelected = 0;
                                          } else {
                                            locationType.isSelected = 1;
                                          }

                                          locationFilterMapOne.refresh();
                                        },
                                        child: Row(children: [
                                          Checkbox(
                                              value:
                                                  locationType.isSelected == 1
                                                      ? true
                                                      : false,
                                              onChanged: (value) {
                                                // if (value!) {
                                                //   locationType.isSelected = 0;
                                                // } else {
                                                //   locationType.isSelected = 1;
                                                // }
                                              }),
                                          Flexible(
                                              child: Text(locationType.name))
                                        ]),
                                      )),
                                );
                              }),
                        ),
                      )),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CSizes.lg, vertical: CSizes.sm),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: WidgetStateProperty.all<Size?>(
                              Size(double.infinity, 50)),
                        ),
                        onPressed: () {
                          Get.back();
                          if(isGlobalFilter){
                            submitLocationFilter(locationFilterMapOne);
                          }else{
                            submitComponentLocationFilter(locationFilterMapOne,controller);
                          }
                        },
                        child: Text(
                          AppLanguageUtils.instance.apply,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                )),
          ]),
        ));
  }

  duplicateComponent(
      DashboardComponentModel model, DashboardReportIds type) async {
    var dashboardList = dashComponentsList[model.type]!;
    Rx<DashboardComponentModel> dashboardComponentModel =
        DashboardComponentModel(
      type: type,
    ).obs;

    dashboardComponentModel.value.reportId = type.name.split("_")[0];
    dashboardComponentModel.value.reportWindowId = type.name.split("_")[1];
    dashboardComponentModel.value.isLoading = true;
    dashboardComponentModel.value.response = model.response;
    dashboardComponentModel.value.isDuplicate = true;
    dashboardComponentModel.value.uuid = Uuid().v1();

    dashboardComponentModel.value.userId = model.userId;
    dashboardComponentModel.value.userTypeId = model.userTypeId;
    dashboardComponentModel.value.filterOptionBase = model.filterOptionBase;
    dashboardComponentModel.value.filterOptionMonth = model.filterOptionMonth;
    dashboardComponentModel.value.filterOptionYear = model.filterOptionYear;
    dashboardComponentModel.value.locationFilterUID = model.locationFilterUID;
    dashboardComponentModel.value.locationFilterMap = cloneLocationFilterMap(model.locationFilterMap);

    dashboardList.add(dashboardComponentModel);

    // dashComponentsList.assign(type, dashboardComponentModel);
    dashComponentsList.addIf(true, type, dashboardList);

    dashComponentsList.refresh();
  }
}
