import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_icons.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/widgets/screen_header.dart';
import 'package:nuntium/features/home/presentation/controller/home_controller.dart';
import 'package:nuntium/features/home/presentation/view/widgets/category.dart';
import 'package:nuntium/features/home/presentation/view/widgets/news_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                child: header(
                  title: ManagerStrings.browse,
                  paragraph: ManagerStrings.homeParagraph,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                child: Container(
                  height: ManagerHeight.h56,
                  decoration: BoxDecoration(
                    color: ManagerColors.greyLighter,
                    borderRadius: BorderRadius.all(
                      Radius.circular(ManagerRadius.r16),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: ManagerHeight.h16,
                      ),
                      hintText: "Search",
                      hintStyle: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.greyPrimary,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        ManagerIcons.search,
                        color: ManagerColors.greyPrimary,
                      ),
                      suffixIcon: Icon(
                        ManagerIcons.mic,
                        color: ManagerColors.greyPrimary,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              SizedBox(
                height: ManagerHeight.h32,
                child: ListView(
                  // itemExtent: ManagerWidth.w81,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: ManagerWidth.w20,
                    ),
                    category(
                      text: "Random",
                      isChecked: true,
                    ),
                    category(
                      text: "Sports",
                      isChecked: true,
                    ),
                    category(
                      text: "Gaming",
                      isChecked: true,
                    ),
                    category(
                      text: "Politics",
                      isChecked: true,
                    ),
                    category(
                      text: "History",
                      isChecked: true,
                      margin: 0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ManagerHeight.h24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.articles.length,
                  itemBuilder: (context, index) => newsCard(
                    image: controller.articles[index].imageUrl,
                    text: controller.articles[index].title ?? controller.articles[index].description ?? '',
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
