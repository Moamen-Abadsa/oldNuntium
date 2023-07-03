import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/widgets/will_pop_scope.dart';

Widget scaffoldWithBackGroundImage({
  required Widget child,
  Color backgroundColor = ManagerColors.purplePrimary,
  String image = ManagerAssets.logo,
}) {
  return willPopScope(
    child: Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    ),
  );
}
