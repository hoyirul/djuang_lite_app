import 'package:djuang_lite_app/screens/home/home_screen.dart';
import 'package:djuang_lite_app/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}