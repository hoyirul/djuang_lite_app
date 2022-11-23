import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/choices/choice_screen.dart';
import 'package:djuang_lite_app/screens/customers/auth/register_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginCustomerScreen extends StatelessWidget {
  const LoginCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 50),
          child: Column(
            children: [

              InkWell(
                onTap: () {
                  Get.off(const ChoiceScreen());
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text('Back'),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent
                ),
                child: SvgPicture.asset('assets/svg/auth.svg'),
              ),
              const SizedBox(height: 25,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Let`s you sign in', style: TextStyle(
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
            
              const SizedBox(height: 20,),
              const LabelComponent(label: 'Email : '),
              const InputComponent(hintText: 'Enter your email', obscuredText: false, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 15,),
              const LabelComponent(label: 'Password : '),
              const InputComponent(hintText: 'Enter your password', obscuredText: true, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 25,),
              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(
                  onPressed: () {
                    Get.offAll(const HomeCustomerScreen());
                  }, 
                  child: const Text('Sign in', style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontPicker.bold,
                    color: ColorPicker.white
                ),))
              ),
              
              const SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don`t have account? ', style: TextStyle(
                    fontFamily: FontPicker.regular
                  ),),
                  InkWell(
                    onTap: () {
                      Get.offAll(const RegisterCustomerScreen());
                    },
                    child: const Text('Sign up', style: TextStyle(
                      color: ColorPicker.primary,
                      fontFamily: FontPicker.regular
                    ),),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}