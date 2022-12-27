import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const TextBox({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.grey.shade400,
            hintText: hintText,
            filled: true,
            enabled: true,
            enabledBorder: OutlineInputBorder(
                borderSide:const  BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
