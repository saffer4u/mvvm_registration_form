import 'package:flutter/material.dart';

Future<dynamic> customSimpleDialog({
  required BuildContext context,
  required void Function()? okButton,
  Widget? content,
  Widget? title,
}) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      actions: [
        TextButton(
          onPressed: okButton,
          child: const Text("Ok"),
        ),
      ],
      title: title,
      content: content,
    ),
  );
}
