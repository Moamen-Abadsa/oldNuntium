import 'package:flutter/widgets.dart';
import 'package:nuntium/config/constants.dart';
import 'package:nuntium/core/resorces/manager_colors.dart';
import 'package:nuntium/core/storage/local/app_settings_shared_preferences.dart';

extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullLocale on String? {
  String parseToLocale() {
    if (this == null) {
      return Constants.englishKey;
    } else {
      return this!;
    }
  }
}

extension NonNullFunction on void Function()? {
  void Function() onNull() {
    if (this == null) {
      return () {};
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullColor on Color? {
  Color onNull() {
    if (this == null) {
      return ManagerColors.white;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0.0;
    } else {
      return this!;
    }
  }
}

extension NonNullNewsTopics on NewsTopics? {
  NewsTopics onNull() {
    if (this == null) {
      return NewsTopics.none;
    } else {
      return this!;
    }
  }
}
