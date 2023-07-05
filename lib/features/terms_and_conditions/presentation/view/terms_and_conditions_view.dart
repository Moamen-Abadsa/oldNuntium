import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ManagerStrings.termsAndConditionsTitle,
          style: getSemiBoldTextStyle(
            fontSize: ManagerFontSize.s24,
            color: ManagerColors.blackPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            ManagerStrings.termsAndConditions,
            style: getRegularTextStyle(
              fontSize: ManagerFontSize.s16,
              color: ManagerColors.greyPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
