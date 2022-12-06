import 'package:djuang_lite_app/controllers/profile_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/header_account_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:djuang_lite_app/screens/drivers/account/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeDriverProfileScreen extends StatefulWidget {
  const ChangeDriverProfileScreen({super.key});

  @override
  State<ChangeDriverProfileScreen> createState() => _ChangeDriverProfileScreenState();
}

class _ChangeDriverProfileScreenState extends State<ChangeDriverProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 50),
          child: Column(
            children: [
              HeaderAccountComponent(
                inkWell: InkWell(
                    onTap: () {
                    Get.off(const AccountDriverScreen());
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
                child: Text('Change Profile', style: TextStyle(
                  fontFamily: FontPicker.semibold,
                  fontSize: 18,
                  color: ColorPicker.dark
                ),),
              ),

              const SizedBox(height: 20,),
              const LabelComponent(label: 'Name : '),
              InputComponent(textEditingController: profileController.nameController, hintText: 'Enter your name', obscuredText: false, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 10,),
              const LabelComponent(label: 'Address : '),
              InputComponent(textEditingController: profileController.addressController, hintText: 'Enter your address', obscuredText: false, colors: ColorPicker.greyAccent,),

              const SizedBox(height: 25,),
              ButtonComponent(
                height: 50,
                width: double.infinity,
                colors: ColorPicker.primary,
                button: TextButton(
                  onPressed: () {
                    profileController.updateProfile('driver');
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