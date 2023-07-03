import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/widgets/rect_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/resorces/manager_colors.dart';
import '../../../../core/resorces/manager_strings.dart';
import '../../../../routes/routes.dart';

class OutBoardingView extends StatefulWidget {
  const OutBoardingView({super.key});

  @override
  State<OutBoardingView> createState() => _OutBoardingViewState();
}

class _OutBoardingViewState extends State<OutBoardingView> {
  final images = [
    'assets/images/outboarding.png',
    'assets/images/outboarding.png',
    'assets/images/outboarding.png'
  ];

  int activePage = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsetsDirectional.only(
            top: ManagerHeight.h76,
            bottom: ManagerHeight.h16,
            // start: ManagerWidth.w20,
            // end: ManagerWidth.w20,
          ),
          decoration: const BoxDecoration(
              // color: ManagerColors.purpleLight,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                // width: ManagerWidth.w288,
                height: ManagerHeight.h336,
                child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      final image = images[index];
                      return buildImage(image, index);
                    },
                    options: CarouselOptions(
                      height: ManagerHeight.h336,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      autoPlay: false,
                      reverse: false,
                      autoPlayInterval: const Duration(seconds: 2),
                      enableInfiniteScroll: false,
                      animateToClosest: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activePage = index;
                        });
                      },
                      // viewportFraction: 1,
                    )),
              ),
              SizedBox(
                height: ManagerHeight.h40,
              ),
              buildIndex(),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w20),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: rectButton(
                      onPressed: () {
                        if (activePage < 2) {
                          ++activePage;
                          _carouselController.animateToPage(activePage);
                        } else {
                          Get.offAllNamed(Routes.welcome);
                        }
                      },
                      text: ManagerStrings.next),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image, int index) {
    return Container(
      // margin: EdgeInsetsDirectional.symmetric(horizontal: ManagerWidth.w28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(ManagerRadius.r12)),
        color: Colors.grey,
      ),
      child: Image.asset(
        images[index],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildIndex() => AnimatedSmoothIndicator(
        activeIndex: activePage,
        count: images.length,
        effect: const ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            dotColor: ManagerColors.greyLighter,
            activeDotColor: ManagerColors.purplePrimary,
            expansionFactor: 3),
      );
}
