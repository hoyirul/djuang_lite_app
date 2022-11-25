import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/header_account_component.dart';
import 'package:djuang_lite_app/screens/components/setting_component.dart';
import 'package:djuang_lite_app/screens/drivers/account/change_password_screen.dart';
import 'package:djuang_lite_app/screens/drivers/account/change_profile_screen.dart';
import 'package:djuang_lite_app/screens/drivers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountDriverScreen extends StatelessWidget {
  const AccountDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50, bottom: 50),
          child: Column(
            children: [
              HeaderAccountComponent(
                inkWell: InkWell(
                    onTap: () {
                    Get.off(const HomeDriverScreen());
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.arrow_back_ios),
                      Text('Back'), 
                    ],
                  ),
                )
              ),

              const SizedBox(height: 40,),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Settings', style: TextStyle(
                  fontFamily: FontPicker.semibold,
                  fontSize: 18,
                  color: ColorPicker.dark
                ),),
              ),

              const SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  Get.off(const ChangeCustomerProfileScreen());
                },
                child: const SettingComponentFeatures(
                  title: 'Change Profile', 
                  icon: Icon(Icons.account_circle_rounded, color: ColorPicker.primary,),
                ),
              ),

              InkWell(
                onTap: () {
                  Get.off(const ChangeCustomerPasswordScreen());
                },
                child: const SettingComponentFeatures(
                  title: 'Change Password', 
                  icon: Icon(Icons.security_rounded, color: ColorPicker.primary,),
                ),
              ),

              InkWell(
                onTap: () {
                  print('oke');
                },
                child: const SettingComponentFeatures(
                  title: 'Help', 
                  icon: Icon(Icons.help_rounded, color: ColorPicker.primary,),
                ),
              ),

              const SizedBox(height: 30,),
              ButtonComponent(
                button: TextButton(
                  onPressed: () {
                    print('Logout');
                  },
                  child: const Text('Logout', style: TextStyle(
                    color: ColorPicker.white,
                    fontFamily: FontPicker.semibold,
                    fontSize: 16
                  ),),
                ), 
                colors: ColorPicker.primary, 
                height: 60, 
                width: double.infinity
              )
            ],
          ),
        ),
      ),
    );
  }
}