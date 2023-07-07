import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/category/presentation/view/categories_view.dart';
import 'package:nuntium/features/home/presentation/view/home_view.dart';
import 'package:nuntium/features/profile/presentation/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainController extends GetxController {
  final persistentTabController = PersistentTabController(initialIndex: 0);

  late List<PersistentBottomNavBarItem> bottomNavBarItems;

  final homeIcon =
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g id="estate (4) 1">
<path id="Vector" d="M20 8.00001L14 2.74001C13.45 2.24805 12.7379 1.97607 12 1.97607C11.262 1.97607 10.55 2.24805 9.99997 2.74001L3.99997 8.00001C3.68234 8.28408 3.42887 8.63256 3.25644 9.02225C3.08402 9.41194 2.99659 9.83389 2.99997 10.26V19C2.99997 19.7957 3.31604 20.5587 3.87865 21.1213C4.44126 21.6839 5.20432 22 5.99997 22H18C18.7956 22 19.5587 21.6839 20.1213 21.1213C20.6839 20.5587 21 19.7957 21 19V10.25C21.0019 9.82557 20.9138 9.40555 20.7414 9.01769C20.5691 8.62983 20.3163 8.28296 20 8.00001V8.00001ZM14 20H9.99997V15C9.99997 14.7348 10.1053 14.4804 10.2929 14.2929C10.4804 14.1054 10.7348 14 11 14H13C13.2652 14 13.5195 14.1054 13.7071 14.2929C13.8946 14.4804 14 14.7348 14 15V20ZM19 19C19 19.2652 18.8946 19.5196 18.7071 19.7071C18.5195 19.8946 18.2652 20 18 20H16V15C16 14.2044 15.6839 13.4413 15.1213 12.8787C14.5587 12.3161 13.7956 12 13 12H11C10.2043 12 9.44126 12.3161 8.87865 12.8787C8.31604 13.4413 7.99997 14.2044 7.99997 15V20H5.99997C5.73476 20 5.4804 19.8946 5.29287 19.7071C5.10533 19.5196 4.99997 19.2652 4.99997 19V10.25C5.00015 10.108 5.03057 9.9677 5.08919 9.83839C5.14781 9.70907 5.2333 9.59372 5.33997 9.50001L11.34 4.25001C11.5225 4.08969 11.7571 4.00127 12 4.00127C12.2429 4.00127 12.4775 4.08969 12.66 4.25001L18.66 9.50001C18.7666 9.59372 18.8521 9.70907 18.9108 9.83839C18.9694 9.9677 18.9998 10.108 19 10.25V19Z" fill="#ACAFC3"/>
</g>
</svg>
''';

  final categoryIcon =
      '''<svg id="eo1jFuyLr9h1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 24 24" shape-rendering="geometricPrecision" text-rendering="geometricPrecision"><g><path d="M10,13h-7c-.26522,0-.51957.1054-.70711.2929s-.29289.4419-.29289.7071v7c0,.2652.10536.5196.29289.7071s.44189.2929.70711.2929h7c.2652,0,.5196-.1054.7071-.2929s.2929-.4419.2929-.7071v-7c0-.2652-.1054-.5196-.2929-.7071s-.4419-.2929-.7071-.2929ZM9,20h-5v-5h5v5ZM21,2h-7c-.2652,0-.5196.10536-.7071.29289s-.2929.44189-.2929.70711v7c0,.2652.1054.5196.2929.7071s.4419.2929.7071.2929h7c.2652,0,.5196-.1054.7071-.2929s.2929-.4419.2929-.7071v-7c0-.26522-.1054-.51957-.2929-.70711s-.4419-.29289-.7071-.29289v0ZM20,9h-5v-5h5v5Zm1,4h-7c-.2652,0-.5196.1054-.7071.2929s-.2929.4419-.2929.7071v7c0,.2652.1054.5196.2929.7071s.4419.2929.7071.2929h7c.2652,0,.5196-.1054.7071-.2929s.2929-.4419.2929-.7071v-7c0-.2652-.1054-.5196-.2929-.7071s-.4419-.2929-.7071-.2929Zm-1,7h-5v-5h5v5ZM10,2h-7c-.26522,0-.51957.10536-.70711.29289s-.29289.44189-.29289.70711v7c0,.2652.10536.5196.29289.7071s.44189.2929.70711.2929h7c.2652,0,.5196-.1054.7071-.2929s.2929-.4419.2929-.7071v-7c0-.26522-.1054-.51957-.2929-.70711s-.4419-.29289-.7071-.29289v0ZM9,9h-5v-5h5v5Z" fill="#acafc3"/></g></svg>''';
  final bookmarkIcon =
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g id="bookmark (2) 1">
<path id="Vector" d="M16 2H8.00001C7.20436 2 6.4413 2.31607 5.87869 2.87868C5.31608 3.44129 5.00001 4.20435 5.00001 5V21C4.99931 21.1762 5.04518 21.3495 5.13299 21.5023C5.22079 21.655 5.3474 21.7819 5.50001 21.87C5.65203 21.9578 5.82447 22.004 6.00001 22.004C6.17554 22.004 6.34799 21.9578 6.50001 21.87L12 18.69L17.5 21.87C17.6524 21.9564 17.8248 22.0012 18 22C18.1752 22.0012 18.3476 21.9564 18.5 21.87C18.6526 21.7819 18.7792 21.655 18.867 21.5023C18.9548 21.3495 19.0007 21.1762 19 21V5C19 4.20435 18.6839 3.44129 18.1213 2.87868C17.5587 2.31607 16.7957 2 16 2ZM17 19.27L12.5 16.67C12.348 16.5822 12.1755 16.536 12 16.536C11.8245 16.536 11.652 16.5822 11.5 16.67L7.00001 19.27V5C7.00001 4.73478 7.10536 4.48043 7.2929 4.29289C7.48044 4.10536 7.73479 4 8.00001 4H16C16.2652 4 16.5196 4.10536 16.7071 4.29289C16.8947 4.48043 17 4.73478 17 5V19.27Z" fill="#ACAFC3"/>
</g>
</svg>''';
  final userIcon =
      '''<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
<g id="user (6) 1">
<path id="Vector" d="M15.71 12.71C16.6904 11.9387 17.406 10.8809 17.7572 9.68394C18.1085 8.48697 18.0779 7.21027 17.6698 6.03147C17.2617 4.85267 16.4963 3.83039 15.4801 3.10686C14.4639 2.38332 13.2474 1.99451 12 1.99451C10.7525 1.99451 9.53611 2.38332 8.51993 3.10686C7.50374 3.83039 6.73834 4.85267 6.33021 6.03147C5.92208 7.21027 5.89151 8.48697 6.24276 9.68394C6.59401 10.8809 7.3096 11.9387 8.29 12.71C6.61007 13.383 5.14428 14.4994 4.04889 15.9399C2.95349 17.3805 2.26956 19.0913 2.07 20.89C2.05555 21.0213 2.06711 21.1542 2.10402 21.2811C2.14093 21.4079 2.20246 21.5263 2.28511 21.6293C2.45202 21.8375 2.69478 21.9708 2.96 22C3.22521 22.0292 3.49116 21.9518 3.69932 21.7849C3.90749 21.618 4.04082 21.3752 4.07 21.11C4.28958 19.1552 5.22168 17.3498 6.68822 16.0388C8.15475 14.7278 10.0529 14.003 12.02 14.003C13.9871 14.003 15.8852 14.7278 17.3518 16.0388C18.8183 17.3498 19.7504 19.1552 19.97 21.11C19.9972 21.3557 20.1144 21.5827 20.2991 21.747C20.4838 21.9114 20.7228 22.0015 20.97 22H21.08C21.3421 21.9698 21.5817 21.8373 21.7466 21.6313C21.9114 21.4252 21.9881 21.1624 21.96 20.9C21.7595 19.0962 21.0719 17.381 19.9708 15.9382C18.8698 14.4954 17.3969 13.3795 15.71 12.71V12.71ZM12 12C11.2089 12 10.4355 11.7654 9.77772 11.3259C9.11992 10.8864 8.60723 10.2616 8.30448 9.53074C8.00173 8.79983 7.92251 7.99557 8.07686 7.21964C8.2312 6.44372 8.61216 5.73099 9.17157 5.17158C9.73098 4.61217 10.4437 4.2312 11.2196 4.07686C11.9956 3.92252 12.7998 4.00173 13.5307 4.30448C14.2616 4.60724 14.8863 5.11993 15.3259 5.77772C15.7654 6.43552 16 7.20888 16 8C16 9.06087 15.5786 10.0783 14.8284 10.8284C14.0783 11.5786 13.0609 12 12 12Z" fill="#ACAFC3"/>
</g>
</svg>''';

  List<Widget> screens = [
    const HomeView(),
    const CategoriesView(),
    Center(
      child: Text(
        'Under Development',
        style: getBoldTextStyle(
          fontSize: 30,
          color: ManagerColors.greyDarker,
        ),
      ),
    ),
    const ProfileView()
  ];

  @override
  void onInit() {
    super.onInit();

    bottomNavBarItems = [
      PersistentBottomNavBarItem(
        icon: SvgPicture.string(
          homeIcon,
        ),
        activeColorPrimary: ManagerColors.purplePrimary,
        inactiveColorPrimary: ManagerColors.greyLight,
        iconSize: ManagerIconSize.s24,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.string(
          categoryIcon,
        ),
        activeColorPrimary: ManagerColors.purplePrimary,
        inactiveColorPrimary: ManagerColors.greyLight,
        iconSize: ManagerIconSize.s24,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.string(
          bookmarkIcon,
        ),
        activeColorPrimary: ManagerColors.purplePrimary,
        inactiveColorPrimary: ManagerColors.greyLight,
        iconSize: ManagerIconSize.s24,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.string(
          userIcon,
        ),
        iconSize: ManagerIconSize.s24,
        activeColorPrimary: ManagerColors.purplePrimary,
        inactiveColorPrimary: ManagerColors.greyLight,
      ),
    ];
  }
}
