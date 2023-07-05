import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_strings.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/features/profile/presentation/controller/profile_controller.dart';

import 'widgets/settings_list_tile.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ManagerWidth.w20,
        ),
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: ManagerHeight.h72,
              ),
              Text(
                ManagerStrings.profile,
                style: getSemiBoldTextStyle(
                  fontSize: ManagerFontSize.s24,
                ),
              ),
              SizedBox(
                height: ManagerHeight.h32,
              ),

              /// User information
              ListTile(
                leading: CircleAvatar(
                  radius: ManagerWidth.w36,
                  backgroundImage: controller.userImage,
                ),
                title: Text(
                  controller.name,
                  style: getSemiBoldTextStyle(
                    fontSize: ManagerFontSize.s16,
                  ),
                ),
                subtitle: Text(
                  controller.email,
                  style: getRegularTextStyle(
                    fontSize: ManagerFontSize.s14,
                    color: ManagerColors.greyPrimary,
                  ),
                ),
              ),
              SizedBox(
                height: ManagerHeight.h32,
              ),
              SettingsListTile(
                title: ManagerStrings.notifications,
                trailing: Switch(
                  activeTrackColor: ManagerColors.purplePrimary,
                  inactiveTrackColor: ManagerColors.greyPrimary,
                  value: controller.isNotificationOn,
                  onChanged: controller.setIsNotificationOn,
                ),
                onPressed: controller.notification,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SettingsListTile(
                title: ManagerStrings.language,
                onPressed: controller.language,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SettingsListTile(
                title: ManagerStrings.changePassword,
                onPressed: controller.changePassword,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SettingsListTile(
                title: ManagerStrings.privacy,
                onPressed: controller.privacy,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SettingsListTile(
                title: ManagerStrings.termsAndConditions,
                onPressed: controller.termsAndConditions,
              ),
              SizedBox(
                height: ManagerHeight.h16,
              ),
              SettingsListTile(
                title: ManagerStrings.signout,
                trailing: Icon(
                  Icons.login_outlined,
                  color: ManagerColors.greyDarker,
                  size: ManagerIconSize.s24,
                ),
                onPressed: controller.signout,
              ),
            ],
          );
        }),
      ),
    );
  }
}
