import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/circle_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  height: 260,
                  color: Colors.transparent,
                ),

                Container(
                  padding: const EdgeInsets.all(0),
                  height: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: ColorPicker.primary
                  ),
                ),

                const Positioned(
                  right: -10,
                  top: -20,
                  child: CircleComponent(height: 150, width: 150),
                ), 

                const Positioned(
                  left: -25,
                  top: 50,
                  child: CircleComponent(height: 100, width: 100),
                ),

                Positioned(
                  left: 25,
                  top: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Hi, Smith Adam', style: TextStyle(
                        fontFamily: FontPicker.bold,
                        fontSize: 21,
                        color: ColorPicker.white
                      ),),

                      Text('Lorem ipsum dolor jamet ansu', style: TextStyle(
                        fontFamily: FontPicker.regular,
                        fontSize: 13,
                        color: ColorPicker.white
                      ),),
                    ],
                  ),
                ),

                Positioned(
                  top: 80,
                  right: 25,
                  child: ButtonComponent(
                    button: TextButton(
                      onPressed: () {
                        Get.offAll(const LoginScreen());
                      },
                      child: const Text('Logout', style: TextStyle(
                        fontFamily: FontPicker.semibold,
                        fontSize: 12,
                        color: ColorPicker.primary
                      ),),
                    ),
                    colors: ColorPicker.white,
                    height: 40,
                    width: 120,
                  ),
                ),

                Positioned(
                  top: 150,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPicker.white,
                      boxShadow: const [
                        BoxShadow(
                          color: ColorPicker.greyLight,
                          offset: Offset(0, 1),
                          blurRadius: 1
                        )
                      ]
                    ),
                  ),
                )

              ],
            )
          ],
        ),
      )
    );
  }
}