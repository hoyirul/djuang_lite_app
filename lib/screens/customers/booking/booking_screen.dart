import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              const SizedBox(height: 50,),

              InkWell(
                onTap: () {
                  Get.off(const HomeCustomerScreen());
                },
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back_ios),
                    Text('Back'), 
                  ],
                ),
              ),

              const SizedBox(height: 10,),
              const Text('Booking', style: TextStyle(
                fontFamily: FontPicker.bold,
                fontSize: 25
              ),),
              const SizedBox(height: 2,),
              const Text('And enjoy life during the time', style: TextStyle(
                fontFamily: FontPicker.regular,
                fontSize: 14,
                color: ColorPicker.grey
              ),),

              const SizedBox(height: 20,),

              const LabelComponent(label: 'From : '),
              const InputComponent(hintText: 'Senin', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Until : '),
              const InputComponent(hintText: 'Jumat', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Pickup Point (Departure) : '),
              const InputComponent(hintText: 'Ex: Jl. Mertojoyo Gg 3, Merjosari', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Destination : '),
              const InputComponent(hintText: 'Ex: Rektor Universitas Brawijaya', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Pickup Point (Return) : '),
              const InputComponent(hintText: 'Ex: Depan Gedung Sipil UB', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Hours of Departure : '),
              const InputComponent(hintText: '07.00', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Hours of Return : '),
              const InputComponent(hintText: '16.00', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 20,),

              const ButtonComponent(
                button: TextButton(
                  onPressed: null,
                  child: Text('Next', style: TextStyle(
                    color: ColorPicker.white,
                    fontFamily: FontPicker.semibold,
                    fontSize: 16
                  ),),
                ),
                colors: ColorPicker.primary,
                height: 60,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}