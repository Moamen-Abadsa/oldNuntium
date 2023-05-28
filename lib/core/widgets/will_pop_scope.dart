import 'package:flutter/cupertino.dart';

Widget willPopScope({
  required Widget child,
}) {
  return WillPopScope(
    child: child,
    onWillPop: () async => false,
  );
}
