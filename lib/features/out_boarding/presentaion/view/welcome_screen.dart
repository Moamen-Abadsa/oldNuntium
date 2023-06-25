import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: ManagerHeight.h110,
          ),
          Image.asset(
            ManagerAssets.illustration,
            // fit: BoxFit.scaleDown,
          )
        ],
      )),
    );
  }
}
