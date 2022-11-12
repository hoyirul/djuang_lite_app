import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  final String hintText;
  final bool obscuredText;
  final Color colors;
  const InputComponent({super.key, required this.hintText, required this.obscuredText, required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: colors,
          boxShadow: const [
            BoxShadow(
              color: ColorPicker.greyLight,
              offset: Offset(0, 1),
              blurRadius: 0.3
            )
          ]
        ),
        child: TextFormField(
          obscureText: obscuredText,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontFamily: FontPicker.regular, 
              color: ColorPicker.grey,
              fontSize: 12
            )
          ),
        ),
      ),
    );
  }
}