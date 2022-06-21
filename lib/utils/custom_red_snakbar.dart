import 'package:flutter/material.dart';

import '../constants/colors.dart';

void customRedSnakbar({
  required BuildContext context,
  required String title,
  required String body,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: RED_COLOR,
      margin: const EdgeInsets.all(25),
      dismissDirection: DismissDirection.horizontal,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(body),
        ],
      ),
    ),
  );
}
