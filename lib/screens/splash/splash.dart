import 'dart:async';

import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/choices/choice_screen.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:djuang_lite_app/screens/drivers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    redirectScreen();
  }

  void redirectScreen() async {
    final prefs = await _prefs;
    if(prefs.getString('access_token') == null){
      Timer(const Duration(seconds: 3), () => Get.off(const ChoiceScreen()));
    }else{
      switch(prefs.getInt('role_id')){
        case 3:
          Timer(const Duration(seconds: 3), () => Get.off(const HomeDriverScreen()));
          break;
        case 4:
          Timer(const Duration(seconds: 3), () => Get.off(const HomeCustomerScreen()));
          break;
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
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