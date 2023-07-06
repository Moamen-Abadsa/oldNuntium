import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:nuntium/core/widgets/screen_header.dart';

class SelectFavouriteView extends StatelessWidget {
  const SelectFavouriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(
                title: ManagerStrings.selectYourFavouriteTopics,
                paragraph: ManagerStrings.selectYourFavouriteTopicsParagraph,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ManagerWidth.w16,
                    mainAxisSpacing: ManagerHeight.h16,
                    childAspectRatio: 160 / 72),
                itemBuilder: (context, index) {
                  return Container(
                    // height: ManagerHeight.h72,
                    // width: ManagerWidth.w160,
                    decoration: BoxDecoration(
                        color: ManagerColors.greyLighter,
                        borderRadius: BorderRadius.all(
                          Radius.circular(ManagerRadius.r16),
                        )),
                    child: Center(
                      child: Text(
                        ManagerStrings.sports,
                        style: getSemiBoldTextStyle(
                          fontSize: ManagerFontSize.s16,
                          color: ManagerColors.greyDarker,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              rectButton(onPressed: () {}, text: ManagerStrings.next)
            ],
          ),
        ),
      ),
    );
  }
}
