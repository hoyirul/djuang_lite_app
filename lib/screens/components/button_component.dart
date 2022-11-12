import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  final TextButton button;
  const ButtonComponent({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorPicker.primary
        ),
        child: button,
      ),
    );
  }
}