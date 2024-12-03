import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_supervisor/features/authentication/screens/login/widgets/login_form.dart';
import 'package:sales_supervisor/features/authentication/screens/login/widgets/login_header.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/language/app_language_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    // animateToMaxMin(double max, double min, double direction, int seconds,
    //     ScrollController scrollContainer) {
    //   scrollContainer
    //       .animateTo(direction,
    //           duration: Duration(seconds: seconds), curve: Curves.linear)
    //       .then((value) {
    //     direction = direction == max ? min : max;
    //     // direction = max;
    //     animateToMaxMin(max, min, direction, seconds, scrollContainer);
    //   });
    //   // scrollContainer.keepScrollOffset;
    //   // scrollContainer.
    // }
    //
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   double minScrollExtent = _scrollController.position.minScrollExtent;
    //   double maxScrollExtent = _scrollController.position.maxScrollExtent;
    //
    //   animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 10,
    //       _scrollController);
    // });

    final isDark = CHelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: CSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Header
              LoginHeader(),
              ///Form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Scaffold.of(context).showBottomSheet(
            clipBehavior: Clip.antiAlias,
            showDragHandle: false,
            enableDrag: true,
            sheetAnimationStyle:
                AnimationStyle(duration: Duration(milliseconds: 1000)),
            (BuildContext context) {
              return Container(
                // color: Colors.grey.shade100,
                child: Container(
                  // height: 300,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(CSizes.cardRadiusMd),
                                topRight: Radius.circular(CSizes.cardRadiusMd)),
                            shape: BoxShape.rectangle),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Getx',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade200,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.star,
                              size: 32,
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
          );

          // showModalBottomSheet(
          //     enableDrag: true,
          //     elevation: 0,
          //     context: context, builder: (context){
          //
          //   return Stack(
          //     children: [
          //       Container(
          //         margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
          //         decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(CSizes.cardRadiusMd),
          //                 topRight: Radius.circular(CSizes.cardRadiusMd)),
          //             shape: BoxShape.rectangle),
          //         child: Center(
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                 'Getx',
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .bodyMedium!
          //                     .copyWith(fontSize: 24),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Positioned(left: 0, right: 0,
          //           child: Container(
          //             width: 120,
          //             height: 120,
          //             decoration: BoxDecoration(
          //                 color: Colors.blue.shade200,
          //                 shape: BoxShape.circle
          //             ),
          //             child: Icon(
          //               Icons.star,size: 32,color: Colors.grey,
          //             ),
          //           )),
          //     ],
          //   );
          // });
          // Get.bottomSheet(
          //   Stack(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
          //       decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.only(
          //               topLeft: Radius.circular(CSizes.cardRadiusMd),
          //               topRight: Radius.circular(CSizes.cardRadiusMd)),
          //           shape: BoxShape.rectangle),
          //       child: Center(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'Getx',
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .bodyMedium!
          //                   .copyWith(fontSize: 24),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //     Positioned(left: 0, right: 0,
          //         child: Container(
          //           width: 60,
          //           height: 60,
          //           decoration: BoxDecoration(
          //             color: Colors.blue.shade200,
          //             shape: BoxShape.circle
          //           ),
          //           child: Icon(
          //             Icons.star,size: 32,color: Colors.grey,
          //           ),
          //         )),
          //   ],
          // ),
          //
          //   backgroundColor: Colors.transparent,
          //   enterBottomSheetDuration: Duration(milliseconds: 500),
          //   exitBottomSheetDuration: Duration(milliseconds: 500),
          //   persistent: true,
          // );
        },
        child: Text(AppLanguageUtils.instance.loginWithMobile),
      ),
    );
  }
}
