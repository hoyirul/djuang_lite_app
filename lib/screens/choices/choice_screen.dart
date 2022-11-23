import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/drivers/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent
                ),
                child: SvgPicture.asset('assets/svg/choices.svg'),
              ),

              const SizedBox(height: 30,),
              
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Choose your account', style: TextStyle(
                  color: ColorPicker.dark,
                  fontFamily: FontPicker.bold,
                  fontSize: 25
                ),),
              ),
              const SizedBox(height: 5,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Welcome back you have been missed.', style: TextStyle(
                  color: ColorPicker.grey,
                  fontFamily: FontPicker.regular,
                  fontSize: 12
                ),),
              ),
            
              const SizedBox(height: 50,),

              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.white,
                button: TextButton(
                  onPressed: () {
                    Get.offAll(const LoginCustomerScreen());
                  }, 
                  child: const Text('Sign in as Customer', style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontPicker.semibold,
                    color: ColorPicker.primary
                ),))
              ),

              const SizedBox(height: 15,),

              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(
                  onPressed: () {
                    Get.offAll(const LoginDriverScreen());
                  }, 
                  child: const Text('Sign in as Driver', style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontPicker.semibold,
                    color: ColorPicker.white
                ),))
              ),
            ],
          ),
        ),
      ),
    );
  }
}