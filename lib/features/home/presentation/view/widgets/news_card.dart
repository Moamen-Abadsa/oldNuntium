import 'package:flutter/material.dart';
import 'package:nuntium/core/resorces/manager_assets.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/resorces/manager_fonts.dart';
import 'package:nuntium/core/resorces/manager_icons.dart';
import 'package:nuntium/core/resorces/manager_sizes.dart';
import 'package:nuntium/core/resorces/manager_styles.dart';

Column newsCard({
  required String? image,
  required String text,
}) {
  return Column(
    children: [
      Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  ManagerRadius.r20,
                ),
              ),
            ),
            child: Image(
              image: (image == null ? const AssetImage(ManagerAssets.news_placeholder) : NetworkImage(image))
                  as ImageProvider,
              fit: BoxFit.cover,
              width: ManagerWidth.w336,
              height: ManagerHeight.h272,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: ManagerHeight.h80,
              width: ManagerWidth.w336,
              decoration: BoxDecoration(
                color: ManagerColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    ManagerRadius.r20,
                  ),
                  bottomRight: Radius.circular(
                    ManagerRadius.r20,
                  ),
                ),
                border: Border.all(
                  width: ManagerWidth.w1,
                  color: ManagerColors.greyLighter,
                ),
              ),
              child: Center(
                child: ListTile(
                  title: Text(
                    text,
                    style: getSemiBoldTextStyle(
                        fontSize: ManagerFontSize.s16, color: ManagerColors.blackPrimary),
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      ManagerIcons.bookmark_border_outlined,
                      size: ManagerFontSize.s30,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: ManagerHeight.h24,
      )
    ],
  );
}
