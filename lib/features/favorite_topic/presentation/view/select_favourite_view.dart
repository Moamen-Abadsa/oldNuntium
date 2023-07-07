import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:nuntium/core/widgets/screen_header.dart';
import 'package:nuntium/features/favorite_topic/presentation/controller/select_favorite_topic_controller.dart';

class SelectFavouriteView extends GetView<SelectFavoriteTopicController> {
  const SelectFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ManagerWidth.w20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(
                title: ManagerStrings.selectYourFavouriteTopics,
                paragraph: ManagerStrings.selectYourFavouriteTopicsParagraph,
              ),
              GetBuilder<SelectFavoriteTopicController>(builder: (_) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.topics.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ManagerWidth.w16,
                    mainAxisSpacing: ManagerHeight.h16,
                    childAspectRatio: 160 / 72,
                  ),
                  itemBuilder: (_, index) {
                    final topic = controller.topics[index];
                    return GestureDetector(
                      onTap: () => controller.onTopicPressed(index),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: topic.isSelected ? ManagerColors.purplePrimary : ManagerColors.greyLighter,
                          borderRadius: BorderRadius.all(
                            Radius.circular(ManagerRadius.r12),
                          ),
                        ),
                        child: Text(
                          topic.name,
                          style: getSemiBoldTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: topic.isSelected ? ManagerColors.white : ManagerColors.greyDarker,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(
                height: 16,
              ),
              rectButton(
                onPressed: controller.onNextPressed,
                text: ManagerStrings.next,
              )
            ],
          ),
        ),
      ),
    );
  }
}
