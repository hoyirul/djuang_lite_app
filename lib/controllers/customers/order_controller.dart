import 'dart:convert';

import 'package:djuang_lite_app/models/order_model.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/transaction/transaction_screen.dart';
import 'package:djuang_lite_app/utils/header_helpers.dart';
import 'package:djuang_lite_app/utils/http_helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController{
  final isLoading = true.obs;
  final orderList = <OrderModel>[].obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController? datePickerFrom = TextEditingController();
  TextEditingController? datePickerTo = TextEditingController();
  TextEditingController? hourDeparture = TextEditingController();
  TextEditingController? hourReturn = TextEditingController();
  TextEditingController pickupAddress = TextEditingController();
  TextEditingController destinationAddress = TextEditingController();
  TextEditingController pickupReturnAddress = TextEditingController();
  TextEditingController information = TextEditingController();

  @override
  void onInit(){
    fetchData();
    datePickerFrom!.text = DateTime.now().toString();
    datePickerTo!.text = DateTime.now().toString();
    hourDeparture!.text = '07:00';
    hourReturn!.text = '18:00';
    super.onInit();
  }

  void fetchData() async {
    try{
      isLoading(true);
      var orders = await getList();
      if(orders != null){
        orderList.assignAll(orders);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<OrderModel>?> getList() async {
    final prefs = await _prefs;
    var id = prefs.getInt('id');
    try{
      var url = Uri.parse(HttpHelper().getUri('/orders/$id/customer'));

      final response = await http.get(url, headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));

      print(response.statusCode);
      print(jsonDecode(response.body));

      if(response.statusCode == 200){
        var decodeJson = json.decode(response.body)['data'];
        var jsonString = json.encode(decodeJson);
        return orderModelFromJson(jsonString);
      }

    }catch(error){
      Get.back();
      
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
    return null;
  }

  void showAlert(title, error, Color colors){
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Text(title, style: TextStyle(
            color: colors,
            fontFamily: FontPicker.medium
          ),),
          contentPadding: const EdgeInsets.all(20),
          children: [Text(error)],
        );
      });
  }

  Future<void> addOrder() async {
    final prefs = await _prefs;
    var id = prefs.getInt('id');
    final url = Uri.parse(HttpHelper().getUri('/orders'));
    Map body = {
      'customer_id': id,
      'date_start': datePickerFrom!.text.trim(),
      'date_end': datePickerTo!.text.trim(),
      'pickup_address': pickupAddress.text,
      'destination_address': destinationAddress.text,
      'pickup_return_address': pickupReturnAddress.text,
      'time_pickup': hourDeparture!.text,
      'time_return': hourReturn!.text,
      'information': information.text
    };
    try{
      final response = await http.post(url, body: jsonEncode(body), headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));
      print(response.body);
      if(response.statusCode == 200){
        final json = jsonDecode(response.body);

        datePickerFrom!.clear();
        datePickerTo!.clear();
        pickupAddress.clear();
        destinationAddress.clear();
        pickupReturnAddress.clear();
        hourDeparture!.clear();
        hourReturn!.clear();
        information.clear();

        Get.off(const TransactionCustomerScreen());
        showAlert('Success', 'your order has been processed!', Colors.green);
      }else if(response.statusCode == 400){
        throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
      }else if(response.statusCode == 422){
        throw 'Textfield must be filled!';
      }else{
        throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
      }
    }catch(error){
      showAlert('Error', error.toString(), ColorPicker.danger);
    }
  }
}