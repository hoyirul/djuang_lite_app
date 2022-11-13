import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeFeatureComponent extends StatelessWidget {
  final String icons, title;
  const HomeFeatureComponent({super.key, required this.icons, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorPicker.rectangle),
      child: Column(
        children: [
          Center(
            child: SvgPicture.asset(icons),
          ),
          const Center(
            child: Text(
              'Booking',
              style: TextStyle(
                  color: ColorPicker.grey,
                  fontSize: 12,
                  fontFamily: FontPicker.medium),
            ),
          )
        ],
      ),
    );
  }
}
