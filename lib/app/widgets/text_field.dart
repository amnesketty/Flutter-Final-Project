import 'package:flutter/material.dart';

class TextFieldCustome extends StatelessWidget {
  final textEditingController;
  final textLabel;

  const TextFieldCustome({
    required this.textEditingController,
    required this.textLabel
  });

  @override
  Widget build(BuildContext context) => 
    Container(
      margin: null,
      padding: null,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: TextField(
        controller: textEditingController,
        keyboardType: textLabel == 'Email' ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: const OutlineInputBorder(),
          hintText: textLabel,
          //suffixIcon: IconButton(onPressed: (){}, icon: null)
        ),
        style: const TextStyle(
          fontSize: 16
        ),
        //cursorColor: Color(0XFFE67E22),
      ),
    );
}