import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const SizedBox(height: 15,),
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
                child: Text('Welcome !', style: TextStyle(
                  color: ColorPicker.dark,
                  fontFamily: FontPicker.bold,
                  fontSize: 25
                ),),
              ),
              const SizedBox(height: 5,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('And enjoy life during the time.', style: TextStyle(
                  color: ColorPicker.grey,
                  fontFamily: FontPicker.regular,
                  fontSize: 12
                ),),
              ),
      
              const SizedBox(height: 20,),
              const LabelComponent(label: 'Name : '),
              const InputComponent(hintText: 'Enter your name', obscuredText: false, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 15,),
              const LabelComponent(label: 'Email : '),
              const InputComponent(hintText: 'Enter your email', obscuredText: false, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 15,),
              const LabelComponent(label: 'Password : '),
              const InputComponent(hintText: 'Enter your password', obscuredText: true, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 15,),
              const LabelComponent(label: 'Confirm Password : '),
              const InputComponent(hintText: 'Confirm your password', obscuredText: true, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 25,),
              const ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(onPressed: null, child: Text('Sign up', style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontPicker.bold,
                  color: ColorPicker.white
                ),))
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have account? ', style: TextStyle(
                    fontFamily: FontPicker.regular
                  ),),
                  InkWell(
                    onTap: () {
                      Get.offAll(const LoginScreen());
                    },
                    child: const Text('Sign in', style: TextStyle(
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