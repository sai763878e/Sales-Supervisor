import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/http.dart';
import 'package:sales_supervisor/common/widgets/app_bar/app_bar.dart';
import 'package:sales_supervisor/common/widgets/app_bar/tab_bar.dart';
import 'package:sales_supervisor/features/FeedsScreen/screens/feeds_screen.dart';
import 'package:sales_supervisor/features/president_dashboard/controllers/president_dashboard_controller.dart';
import 'package:sales_supervisor/features/president_dashboard/screens/president_my_dashboard.dart';
import 'package:sales_supervisor/utils/constants/colors.dart';
import 'package:sales_supervisor/utils/constants/sizes.dart';
import 'package:sales_supervisor/utils/helpers/helper_functions.dart';
import 'package:sales_supervisor/utils/language/app_language_utils.dart';

class PresidentDashboard extends StatelessWidget {
  PresidentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PresidentDashboardController());
    final isDark = CHelperFunction.isDarkMode(context);
    return DefaultTabController(
        length: controller.tabs.length,
        child: Scaffold(
          appBar: CAppBar(
            title: Text(
              AppLanguageUtils.instance.dashboard,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: isDark ? CColors.light : CColors.dark),
            ),
          ),
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: isDark ? CColors.black : CColors.white,
                  expandedHeight: 100,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(CSizes.defaultSpace),
                  ),
                  // snap: true,
                  // stretch: true,
                  centerTitle: true,
                  bottom: CTabBar(

                    tabs: controller.tabs
                        .map((tab) => Tab(
                              child: Text(tab),
                            ))
                        .toList(),
                  ),
                )
              ];
            },
            body: TabBarView(
              children: [PresidentMyDashboard(), FeedsScreen()],
            ),
          ),
        ));
  }
}

