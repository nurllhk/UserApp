import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintext;
  final bool obsurtext;

  const MyTextField(
      {super.key,
        required this.textEditingController,
        required this.hintext,
        required this.obsurtext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: obsurtext,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)),
          focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: hintext,
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
