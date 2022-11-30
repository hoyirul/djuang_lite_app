import 'package:djuang_lite_app/controllers/customers/order_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerComponent extends StatefulWidget {
  final String hintText;
  final bool obscuredText;
  final Color colors;
  final TextEditingController? textEditingController;
  const DatePickerComponent({super.key, this.textEditingController, required this.hintText, required this.obscuredText, required this.colors});

  @override
  State<DatePickerComponent> createState() => _DatePickerComponentState();
}

class _DatePickerComponentState extends State<DatePickerComponent> {
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
            DateTime? picked = await showDatePicker(
                context: Get.context!,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2030)
              );
            if (picked != null){
              widget.textEditingController!.text = picked.toString();
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