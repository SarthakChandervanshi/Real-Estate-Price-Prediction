import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.textEditingController, this.textInputType = TextInputType.text, this.hintText});

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? hintText;

  final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
        color: Colors.blue,
      width: 2
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),
      maxLines: 1,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: _border,
        focusedErrorBorder: _border,
        focusedBorder: _border,
        errorBorder: _border,
        enabledBorder: _border,
        disabledBorder: _border,
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.grey),
      ),
    );
  }
}
