import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  final textEditingController;
  final textLabel;
  final bool visible;
  final VoidCallback refresh;

  const TextFieldPassword(
      {super.key,
      required this.textEditingController,
      required this.textLabel,
      required this.visible,
      required this.refresh});

  @override
  Widget build(BuildContext context) => Container(
        margin: null,
        padding: null,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: textEditingController,
          obscureText: visible == true ? false : true,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: const OutlineInputBorder(),
              hintText: textLabel,
              suffixIcon: IconButton(
                  onPressed: refresh,
                  icon: visible == true
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off))),
          style: const TextStyle(fontSize: 16),
        ),
      );
}
