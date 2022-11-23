import 'dart:async';

import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.off(const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primary,
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            const Center(
              child: Text('Djuang Apps', style: TextStyle(
                color: ColorPicker.white,
                fontFamily: FontPicker.bold,
                fontSize: 40
              ),),
            ),

            Container(
              padding: const EdgeInsets.only(bottom: 50),
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text('By Aktifin Aja', style: TextStyle(
                  fontFamily: FontPicker.medium,
                  color: ColorPicker.white
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}