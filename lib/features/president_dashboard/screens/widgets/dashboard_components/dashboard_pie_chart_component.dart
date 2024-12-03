import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/widgets/circular_donought_pie_chart.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class DashboardPieChartComponent extends StatelessWidget {
  DashboardPieChartComponent({
    super.key,
    this.isLoading = false,
    this.title = "",
    this.subTitle = "",
    required this.charData,
  });

  bool isLoading;
  final title;

  final subTitle;

  List charData;

  // List charData = [
  //   [10, 'Protein', Colors.purple],
  //   [50, 'Carbs', Colors.yellow],
  //   [10, 'Fats', Colors.indigo],
  //   [30, 'Calories', Colors.orange],
  // ];

  final cardRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunction.isDarkMode(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: isLoading ?
      Shimmer.fromColors(
        child: Container(
          width: CHelperFunction.screenWidth() * 0.85,
          height: CSizes.dashboardComponent,
          decoration: BoxDecoration(
            color: isDark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(cardRadius),

            // boxShadow: [
            //   BoxShadow(
            //       color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
            //       // offset: Offset(3, 3),
            //       blurRadius: 10,
            //       spreadRadius: 1),
            //   BoxShadow(
            //       color: isDark
            //           ? Colors.grey.shade900
            //           : Colors.white.withOpacity(0.5),
            //       // offset: Offset(-2, -2),
            //       blurRadius: 10,
            //       spreadRadius: 1)
            // ],
          ),
        ),
        baseColor: isDark ? Colors.grey.shade600 : Colors.grey.shade100,
        highlightColor:
        isDark ? Colors.grey.shade500 : Colors.white.withOpacity(1),
      )
      :
      Container(
        width: CHelperFunction.screenWidth() * 0.85,
        height: CSizes.dashboardComponent,
        decoration: BoxDecoration(
          color: isDark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(cardRadius),
          boxShadow: [
            BoxShadow(
                color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
                offset: Offset(3, 3),
                blurRadius: 10,
                spreadRadius: 1),
            BoxShadow(
                color: isDark
                    ? Colors.grey.shade900
                    : Colors.white.withOpacity(0.5),
                offset: Offset(-2, -2),
                blurRadius: 10,
                spreadRadius: 1)
          ],
        ),
        child:  Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   title,
                        //   style: Theme.of(context).textTheme.titleMedium,
                        // ),
                        // Text(
                        //   title,
                        //   style: Theme.of(context).textTheme.labelMedium,
                        // ),
                        Container(
                          height: 550,
                          child: CircularDonoughtPieChart(
                                                      chartData: charData,
                                                      isHorizontal: true,
                                                      isVisible: false,
                                                    ),
                        ),
                        // Container(
                        //   child: CircularDonoughtPieChart(
                        //     chartData: charData,
                        //     isHorizontal: true,
                        //     isVisible: false,
                        //   ),
                        // ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      // color: Colors.blue.shade100,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(cardRadius),
                              bottomRight: Radius.circular(cardRadius))),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 2, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.fullscreen,
                              color: Colors.green,
                            ),
                            Text(
                              AppLanguageUtils.instance.switchToHiEnd,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue.shade500),
                            ),
                            Text(
                              AppLanguageUtils.instance.switchToVolume,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue.shade500),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
