import 'package:djuang_lite_app/controllers/customers/order_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerComponent extends StatefulWidget {
  final String hintText;
  final bool obscuredText;
  final Color colors;
  final TextEditingController? textEditingController;
  const TimePickerComponent({super.key, this.textEditingController, required this.hintText, required this.obscuredText, required this.colors});

  @override
  State<TimePickerComponent> createState() => _TimePickerComponentState();
}

class _TimePickerComponentState extends State<TimePickerComponent> {
  OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: widget.colors,
          boxShadow: const [
            BoxShadow(
              color: ColorPicker.greyLight,
              offset: Offset(0, 1),
              blurRadius: 0.3
            )
          ]
        ),
        child: TextFormField(
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode()); 
            TimeOfDay? picked = await showTimePicker(
                context: Get.context!,
                initialTime: TimeOfDay.now(),
              );
            if (picked != null){
              widget.textEditingController!.text = picked.toString().substring(10, 15);
            }
            // orderController.datePicker.text = date!.toIso8601String();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Choose Date';
            }
            return null;
          },
          controller: widget.textEditingController,
          obscureText: widget.obscuredText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontFamily: FontPicker.regular, 
              color: ColorPicker.grey,
              fontSize: 12
            )
          ),
        ),
      ),
    );
  }
}