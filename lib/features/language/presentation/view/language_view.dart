import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/features/language/presentation/controller/language_controller.dart';
import 'package:nuntium/features/language/presentation/view/widgets/languageCard.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(ManagerStrings.language),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
          child: Column(
            children: [
              SizedBox(
                height: ManagerHeight.h16,
              ),
              language(
                  language: ManagerStrings.english,
                  pos: 1,
                  isChecked: controller.isChecked(1)),
              language(
                  language: ManagerStrings.arabic,
                  pos: 2,
                  isChecked: controller.isChecked(2)),
              language(
                  language: ManagerStrings.german,
                  pos: 3,
                  isChecked: controller.isChecked(3)),
              language(
                  language: ManagerStrings.spanish,
                  pos: 4,
                  isChecked: controller.isChecked(4)),
            ],
          ),
        ),
      ),
    );
  }
}
