import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomDropdownTextFormField extends StatelessWidget {
  final String? hintText;
  final bool isEmpty;
  final String? value;
  final String titleText;
  final void Function(String?)? onChanged;
  final List<String> dropDownListOfItems;

  const CustomDropdownTextFormField({
    required this.dropDownListOfItems,
    this.isEmpty = false,
    required this.titleText,
    this.hintText,
    this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  isDense: true,
                  hintText: hintText,
                  labelStyle: TextStyle(
                    fontFamily: "Sofia",
                    fontSize: 14,
                    color: LIGHT_BLUE_COLOR.withOpacity(0.6),
                  ),
                  fillColor: WHITE_COLOR,
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: BLACK_COLOR.withOpacity(0.8),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: BLACK_COLOR.withOpacity(0.8),
                      width: 2.0,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: const BorderSide(
                      color: RED_COLOR,
                      width: 2,
                    ),
                  ),
                ),
                isEmpty: isEmpty,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(14),
                    style: TextStyle(
                      color: LIGHT_BLUE_COLOR.withOpacity(0.8),
                      fontSize: 14,
                      fontFamily: "SofiaPro",
                    ),
                    value: value,
                    isDense: true,
                    onChanged: onChanged,
                    items: dropDownListOfItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
