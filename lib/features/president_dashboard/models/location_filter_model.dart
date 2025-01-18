// To parse this JSON data, do
//
//     final locatioFilter = locatioFilterFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';

LocationFilter locationFilterFromJson(String str) =>
    LocationFilter.fromJson(json.decode(str));

String locationFilterToJson(LocationFilter data) => json.encode(data.toJson());

class LocationFilter {
  int userTypeId;
  int userId;
  List<FilterDatum> filterData;

  LocationFilter({
    this.userTypeId = 0,
    this.userId = 0,
    List<FilterDatum>? filterData,
  }) : filterData = filterData ?? [];

  factory LocationFilter.fromJson(Map<String, dynamic> json) => LocationFilter(
        userTypeId: json["UserTypeId"],
        userId: json["UserId"],
        filterData: List<FilterDatum>.from(
            json["FilterData"].map((x) => FilterDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "UserTypeId": userTypeId,
        "UserId": userId,
        "FilterData": List<dynamic>.from(filterData.map((x) => x.toJson())),
      };
}

class FilterDatum {
  int id;
  String code;
  String name;
  int isSelected;
  String parentLocationId;
  String type;
  String parentType;
  String childType;
  String locationId;

  FilterDatum({
    this.id = 0,
    this.code = "",
    this.name = "",
    this.isSelected = 0,
    this.parentLocationId = "",
    this.type = "",
    this.parentType = "",
    this.childType = "",
    this.locationId = "",
  });

  factory FilterDatum.fromJson(Map<String, dynamic> json) => FilterDatum(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        isSelected: json["IsSelected"],
        parentLocationId: json["ParentLocationId"],
        type: json["Type"],
        parentType: json["ParentType"],
        childType: json["ChildType"],
        locationId: json["LocationId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Code": code,
        "Name": name,
        "IsSelected": isSelected,
        "ParentLocationId": parentLocationId,
        "Type": type,
        "ParentType": parentType,
        "ChildType": childType,
        "LocationId": locationId,
      };

  // A method to clone the FilterDatum object
  FilterDatum clone() {
    return FilterDatum(
      id:id ,
      code:code ,
      name:name,
      isSelected:isSelected,
      parentLocationId:parentLocationId,
      type:type,
      parentType:parentType,
      childType:childType,
      locationId:locationId,
    );
  }

  // Function to deep clone the Map<String, List<FilterDatum>>
  static RxMap<String, List<FilterDatum>> cloneLocationFilterMap(RxMap<String, List<FilterDatum>> original) {
    // Create a new map and clone the values inside it
    var clonedMap = <String, List<FilterDatum>>{}.obs;

    original.forEach((key, valueList) {
      // Clone each list and its contents (deep copy)
      clonedMap[key] = valueList.map((filterDatum) => filterDatum.clone()).toList();
    });

    return clonedMap;
  }
}

class LocationTypesModel{
  LocationTypesModel({required this.type,required this.isSelected});
  String type;
  bool isSelected;
}
