import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.title,
    this.trailing,
    required this.onPressed,
  });

  final String title;
  final Widget? trailing;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: ManagerWidth.w56,
      decoration: ShapeDecoration(
        color: ManagerColors.greyLighter,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ManagerRadius.r12,
          ),
        ),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        splashColor: ManagerColors.transparent,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w24,
            end: ManagerWidth.w16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///title
              Text(
                title,
                style: TextStyle(
                  fontSize: ManagerFontSize.s16,
                  color: ManagerColors.greyDarker,
                  // height: ManagerHeight.h24,
                  fontWeight: ManagerFontWeight.semi_bold,
                ),
              ),

              /// trailing widget
              trailing ??
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ManagerColors.greyDarker,
                    size: ManagerIconSize.s16,
                    
                  )
            ],
          ),
        ),
      ),
    );
  }
}
