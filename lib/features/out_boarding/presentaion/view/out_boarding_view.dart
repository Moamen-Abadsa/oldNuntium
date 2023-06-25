import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/features/out_boarding/presentaion/view/widget/rect_button.dart';

import '../../../../config/constants.dart';
import '../../../../core/resorces/manager_assets.dart';
import '../../../../core/resorces/manager_colors.dart';
import '../../../../core/resorces/manager_strings.dart';
import '../../../../routes/routes.dart';

class OutBoardingView extends StatelessWidget {
  const OutBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: ManagerHeight.h76,
            bottom: ManagerHeight.h16,
            start: ManagerWidth.w20,
            end: ManagerWidth.w20,
          ),
          decoration: BoxDecoration(
              // color: ManagerColors.purpleLight,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: ManagerWidth.w288,
                height: ManagerHeight.h336,
                child: PageView(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          ManagerAssets.outboarding,
                          height: ManagerHeight.h336,
                          width: ManagerWidth.w288,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: Constants.containerDuration),
                    curve: Curves.easeInOut,
                    width: ManagerWidth.w24,
                    height: ManagerHeight.h8,
                    decoration: BoxDecoration(
                      color: ManagerColors.purplePrimary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(ManagerRadius.r4),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ManagerWidth.w8,
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: Constants.containerDuration),
                    curve: Curves.easeInOut,
                    width: ManagerWidth.w8,
                    height: ManagerHeight.h8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ManagerColors.greyLighter,
                    ),
                  ),
                  SizedBox(
                    width: ManagerWidth.w8,
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: Constants.containerDuration),
                    curve: Curves.easeInOut,
                    width: ManagerWidth.w8,
                    height: ManagerHeight.h8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ManagerColors.greyLighter,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h34,
              ),
              Text(
                ManagerStrings.firstToKnow,
                style: TextStyle(
                    fontWeight: ManagerFontWeight.semi_bold,
                    fontSize: ManagerFontSize.s24,
                    color: ManagerColors.blackPrimary,
                    fontFamily: ManagerFontFamily.fontFamily),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Text(
                ManagerStrings.paragraph,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: ManagerFontWeight.regular,
                    fontFamily: ManagerFontFamily.fontFamily,
                    fontSize: ManagerFontSize.s16,
                    color: ManagerColors.greyPrimary),
              ),
              SizedBox(
                height: ManagerHeight.h64,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                  ),
                ),
                child: rectButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.welcome);
                    },
                    text: ManagerStrings.next),
              )
            ],
          ),
        ),
      ),
    );
  }
}
