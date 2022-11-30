import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';

class ScheduleComponent extends StatelessWidget {
  final String time, pickup, destination;
  const ScheduleComponent({super.key, required this.time, required this.pickup, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
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
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Today', style: TextStyle(
                  color: ColorPicker.dark,
                  fontFamily: FontPicker.semibold,
                  fontSize: 14
                ),),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(time, style: const TextStyle(
                  color: ColorPicker.grey,
                  fontFamily: FontPicker.medium,
                  fontSize: 12
                ),),
              ),
            ],
          ),

          const SizedBox(height: 10,),

          Align(
            alignment: Alignment.centerLeft,
            child: Text('$pickup - $destination', style: const TextStyle(
              color: ColorPicker.dark,
              fontFamily: FontPicker.medium,
              fontSize: 12
            ),),
          ),
        ],
      ),
    );
  }
}
