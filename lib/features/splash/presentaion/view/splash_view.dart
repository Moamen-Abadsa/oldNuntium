import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/widgets/scaffold_with_background_image.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return scaffoldWithBackGroundImage(
      child: Center(
        child: SvgPicture.asset(
          ManagerAssets.logo,
          width: ManagerWidth.w120,
        ),
      ),
    );
  }
}
