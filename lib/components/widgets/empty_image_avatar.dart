import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/paths.dart';

class EmptyImageAvatar extends StatelessWidget {
  const EmptyImageAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          backgroundColor: BLACK_COLOR,
          radius: 41,
          child: CircleAvatar(
            backgroundColor: DARK_BLUE_COLOR,
            backgroundImage: AssetImage(AVATAR_IMAGE),
            radius: 40.0,
          ),
        ),
        Positioned(
          right: 2,
          bottom: 2,
          child: Container(
            padding:const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: BLACK_COLOR),
              borderRadius: BorderRadius.circular(90.0),
              color: WHITE_COLOR,
            ),
            child: const Icon(
              Icons.edit,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }
}
