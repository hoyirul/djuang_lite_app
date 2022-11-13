import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:flutter/material.dart';

class ScheduleComponent extends StatelessWidget {
  const ScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(0),
        width: 200,
        height: 100,
        decoration: BoxDecoration(
            color: ColorPicker.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: ColorPicker.greyLight,
                  offset: Offset(0, 1),
                  blurRadius: 2)
            ]),
      ),
    );
  }
}
