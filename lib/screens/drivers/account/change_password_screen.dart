import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:djuang_lite_app/screens/drivers/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeDriverPasswordScreen extends StatelessWidget {
  const ChangeDriverPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 50),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.off(const AccountDriverScreen());
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text('Back'), 
                  ],
                ),
              ),

              const SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: ColorPicker.greyLight,
                    shape: BoxShape.circle
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              const Center(
                child: Text('Elvira Sania Mufida', style: TextStyle(
                  fontFamily: FontPicker.semibold,
                  fontSize: 18
                ),),
              ),

              const SizedBox(height: 5,),
              const Center(
                child: Text('Jl Bunga Andong Timur 19, Malang', style: TextStyle(
                  fontFamily: FontPicker.regular,
                  fontSize: 14
                ),),
              ),

              const SizedBox(height: 40,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Change Password', style: TextStyle(
                  fontFamily: FontPicker.semibold,
                  fontSize: 18,
                  color: ColorPicker.dark
                ),),
              ),

              const SizedBox(height: 20,),
              const LabelComponent(label: 'Old Password : '),
              const InputComponent(hintText: 'Enter your old password', obscuredText: true, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 10,),
              const LabelComponent(label: 'New Password : '),
              const InputComponent(hintText: 'Enter your new password', obscuredText: true, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 10,),
              const LabelComponent(label: 'Confirm Password : '),
              const InputComponent(hintText: 'Enter your confirm password', obscuredText: true, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 25,),
              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(
                  onPressed: () {
                    Get.offAll(const AccountDriverScreen());
                  }, 
                  child: const Text('Update', style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontPicker.bold,
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