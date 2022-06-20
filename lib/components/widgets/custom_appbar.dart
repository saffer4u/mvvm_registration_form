import 'package:flutter/material.dart';

import '../../constants/colors.dart';

AppBar customAppBar({
  required String title,
}) {
  return AppBar(
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
