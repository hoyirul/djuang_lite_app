import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';

class HeaderAccountComponent extends StatelessWidget {
  final InkWell inkWell;
  const HeaderAccountComponent({super.key, required this.inkWell});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inkWell,
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
                color: ColorPicker.greyLight, shape: BoxShape.circle),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(
            'Elvira Sania Mufida',
            style: TextStyle(fontFamily: FontPicker.semibold, fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const Center(
          child: Text(
            'Jl Bunga Andong Timur 19, Malang',
            style: TextStyle(fontFamily: FontPicker.regular, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
