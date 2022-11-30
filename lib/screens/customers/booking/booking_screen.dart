import 'package:djuang_lite_app/controllers/customers/order_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/components/button_component.dart';
import 'package:djuang_lite_app/screens/components/date_picker_component.dart';
import 'package:djuang_lite_app/screens/components/input_component.dart';
import 'package:djuang_lite_app/screens/components/label_component.dart';
import 'package:djuang_lite_app/screens/components/time_picker_component.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              const SizedBox(height: 40,),

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
              DatePickerComponent(textEditingController: orderController.datePickerFrom, hintText: 'Senin', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Until : '),
              DatePickerComponent(textEditingController: orderController.datePickerTo, hintText: 'Senin', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Pickup Point (Departure) : '),
              InputComponent(textEditingController: orderController.pickupAddress, hintText: 'Ex: Jl. Mertojoyo Gg 3, Merjosari', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Destination : '),
              InputComponent(textEditingController: orderController.destinationAddress, hintText: 'Ex: Rektor Universitas Brawijaya', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Pickup Point (Return) : '),
              InputComponent(textEditingController: orderController.pickupReturnAddress, hintText: 'Ex: Depan Gedung Sipil UB', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Hours of Departure : '),
              TimePickerComponent(textEditingController: orderController.hourDeparture, hintText: '07.00', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Hours of Return : '),
              TimePickerComponent(textEditingController: orderController.hourReturn, hintText: '16.00', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 15,),

              const LabelComponent(label: 'Information : '),
              InputComponent(textEditingController: orderController.information, hintText: 'Ex: Dekat pintu masuk', obscuredText: false, colors: ColorPicker.greyAccent),

              const SizedBox(height: 20,),

              ButtonComponent(
                button: TextButton(
                  onPressed: (){
                    orderController.addOrder();
                  },
                  child: const Text('Next', style: TextStyle(
                    color: ColorPicker.white,
                    fontFamily: FontPicker.semibold,
                    fontSize: 16
                  ),),
                ),
                colors: ColorPicker.primary,
                height: 60,
                width: double.infinity,
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}