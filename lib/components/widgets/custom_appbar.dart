import 'package:flutter/material.dart';

import '../../constants/colors.dart';

AppBar customAppBar({
  required String title,
}) {
  return AppBar(
    toolbarHeight: 100,
    iconTheme:const IconThemeData(
      color: DARK_BLUE_COLOR,
    ),
    // leading: const BackButton(color: Color(0xff000075)),
    backgroundColor: TRANSPARENT_COLOR,
    shadowColor: TRANSPARENT_COLOR,
    title: Text(
      title,
      style: const TextStyle(
        color: BLACK_COLOR,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
  );
}
