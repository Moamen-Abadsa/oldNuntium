import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';
import 'package:nuntium/core/service/icon_service.dart';

Container myTextField(
    {bool isObscureText = false,
    required TextEditingController controller,
    required IconData icon,
    String hintText = "Email Address"}) {
  FocusNode focusNode = FocusNode();
  bool isFocused = false;
  focusNode.addListener(() {
    isFocused = focusNode.hasFocus;
  });
  return Container(
    width: double.infinity,
    height: ManagerHeight.h56,
    decoration: BoxDecoration(
        color: ManagerColors.greyLighter,
        borderRadius: BorderRadius.all(
          Radius.circular(ManagerRadius.r12),
        )),
    child: TextField(
      cursorColor: ManagerColors.purplePrimary,
      style: getMediumTextStyle(fontSize: ManagerFontSize.s16, color: ManagerColors.blackPrimary),
      obscureText: isObscureText,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: ManagerColors.greyLighter,
        focusColor: ManagerColors.white,
        hintText: hintText,
        hintStyle: getMediumTextStyle(fontSize: ManagerFontSize.s16, color: ManagerColors.greyPrimary),
        prefixIcon: IconService().getIcon(
          icon: icon,
          iconSize: ManagerFontSize.s24,
          color: isFocused ? ManagerColors.purplePrimary : ManagerColors.greyPrimary,
        ),
        focusedBorder: focusNode.hasFocus
            ? InputBorder.none
            : OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ManagerColors.purplePrimary,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    ManagerRadius.r12,
                  ),
                ),
              ),
        // focusColor: ManagerColors.purplePrimary,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ManagerColors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              ManagerRadius.r12,
            ),
          ),
        ),
      ),
    ),
  );
}
