import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';

class ScheduleComponent extends StatelessWidget {
  const ScheduleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Today', style: TextStyle(
                    color: ColorPicker.dark,
                    fontFamily: FontPicker.semibold,
                    fontSize: 14
                  ),),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text('07.00 AM', style: TextStyle(
                    color: ColorPicker.grey,
                    fontFamily: FontPicker.medium,
                    fontSize: 12
                  ),),
                ),
              ],
            ),

            const SizedBox(height: 10,),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Home - Brawijaya University', style: TextStyle(
                color: ColorPicker.dark,
                fontFamily: FontPicker.semibold,
                fontSize: 12
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
