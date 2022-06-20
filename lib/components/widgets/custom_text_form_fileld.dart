import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextformField extends StatelessWidget {
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final AutovalidateMode? autoValid;
  final int? maxLength;

  const CustomTextformField({
    this.obscureText = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.autoValid,
    this.textCapitalization = TextCapitalization.sentences,
    this.keyboardType,
    this.validator,
    this.labelText,
    this.hintText,
    this.controller,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText == null
              ? const SizedBox.shrink()
              : Text(
                  labelText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
          TextFormField(
            obscureText: obscureText,
            maxLines: maxLines,
            textCapitalization: textCapitalization,
            onTap: onTap,
            maxLength: maxLength,
            autovalidateMode: autoValid,
            keyboardType: keyboardType,
            validator: validator,
            controller: controller,
            cursorRadius: const Radius.circular(10),
            cursorHeight: 17,
            cursorColor: LIGHT_BLUE_COLOR,
            style: TextStyle(
              fontFamily: "SofiaPro",
              fontSize: 14,
              color: LIGHT_BLUE_COLOR.withOpacity(0.8),
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,

              prefixIconColor: BLACK_COLOR,
              filled: true,
              counterText: "",
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 20,
              ),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: BLACK_COLOR.withOpacity(0.8),
                  width: 1,
                ),
              ),
              // isDense: true,
              hintText: hintText,
              labelStyle: TextStyle(
                fontSize: 14,
                color: LIGHT_BLUE_COLOR.withOpacity(0.6),
              ),
              fillColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: BLACK_COLOR,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: BLACK_COLOR.withOpacity(0.8),
                  width: 1.0,
                ),
              ),
              errorBorder: const OutlineInputBorder(
                // borderRadius: BorderRadius.circular(7.0),
                borderSide: BorderSide(
                  color: RED_COLOR,
                  width: 2,
                ),
              ),
              errorStyle: TextStyle(
                fontSize: 10,
                color: BLACK_COLOR.withOpacity(0.75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
