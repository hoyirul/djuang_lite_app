import 'package:djuang_lite_app/controllers/auth/auth_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/choices/choice_screen.dart';
import 'package:djuang_lite_app/screens/drivers/auth/register_screen.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginDriverScreen extends StatefulWidget {
  const LoginDriverScreen({super.key});

  @override
  State<LoginDriverScreen> createState() => _LoginDriverScreenState();
}

class _LoginDriverScreenState extends State<LoginDriverScreen> {
  final AuthController authController = Get.put(AuthController());
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
              InputComponent(textEditingController: authController.emailController, hintText: 'Enter your email', obscuredText: false, colors: ColorPicker.greyAccent,),
      
              const SizedBox(height: 15,),
              const LabelComponent(label: 'Password : '),
              InputComponent(textEditingController: authController.passwordController, hintText: 'Enter your password', obscuredText: true, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 25,),
              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(
                  onPressed: () {
                    authController.authLogin('driver');
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
                      Get.offAll(const RegisterDriverScreen());
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