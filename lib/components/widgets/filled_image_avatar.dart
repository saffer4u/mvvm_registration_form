import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FilledImageAvatar extends StatelessWidget {
  final File image;
  const FilledImageAvatar({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: BLACK_COLOR,
      radius: 41,
      child: CircleAvatar(
        backgroundColor: WHITE_COLOR,
        radius: 40,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
