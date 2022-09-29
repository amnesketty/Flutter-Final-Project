import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onButtonClicked;

  const CustomButton({
    super.key,
    required this.onButtonClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => onButtonClicked,
        // leading: Image.network(user.image),
        child: const Text("LOGIN"),
      );
}