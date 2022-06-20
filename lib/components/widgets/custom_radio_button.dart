import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomRadioButton extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final void Function(dynamic)? onChanged;
  final String title;
  const CustomRadioButton({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        activeColor: LIGHT_BLUE_COLOR,

        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Align(
          alignment: const Alignment(-1.6, 0),
          child:Text(
            title,
            style: TextStyle(
              fontFamily: "Sofia",
              fontSize: 14,
              color: LIGHT_BLUE_COLOR.withOpacity(0.8),
            ),
          ),
        ),
        //  visualDensity: VisualDensity.compact,
      ),
    );
  }
}
