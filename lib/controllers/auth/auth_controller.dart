import 'dart:convert';

import 'package:djuang_lite_app/controllers/profile_controller.dart';
import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:djuang_lite_app/utils/header_helpers.dart';
import 'package:djuang_lite_app/utils/http_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController(text: 'customer@djuang.id');
  TextEditingController passwordController = TextEditingController(text: 'password');

  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

  void showError(title, error){
    Get.back();
    showDialog(
      context: Get.context!,
      builder: (context) {
        return SimpleDialog(
          title: Text(title, style: TextStyle(
            color: (title == 'Warning') ? ColorPicker.warning : ColorPicker.danger,
            fontFamily: FontPicker.medium
          ),),
          contentPadding: const EdgeInsets.all(20),
          children: [Text(error)],
        );
      });
  }

  Future<void> authLoginCustomer(String role) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json'
    };

    final url = Uri.parse(HttpHelper().getUri('/auth/login/$role'));
    Map body = {
      'email': emailController.text.trim(),
      'password': passwordController.text
    };

    if(emailController.text == '' || passwordController.text == ''){
      showError('Warning', 'Email or Password must be filled!');
    }else{
      try{
        final response = await http.post(url, body: jsonEncode(body), headers: headers);
        print(response.body);
        if(response.statusCode == 200){
          final json = jsonDecode(response.body);
          final SharedPreferences prefs = await preferences;
          prefs.setInt('id', json['data']['user']['id']);
          prefs.setString('access_token', json['data']['access_token']);
          prefs.setString('token_type', json['data']['token_type']);
          prefs.setString('name', json['data']['user']['name']);
          prefs.setString('email', json['data']['user']['email']);
          prefs.setInt('role_id', json['data']['user']['role_id']);
          prefs.setString('address', json['data']['user']['address']);
          prefs.setString('image', json['data']['user']['image']);

          emailController.clear();
          passwordController.clear();
          Get.off(const HomeCustomerScreen());
        }else if(response.statusCode == 400){
          throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
        }else{
          throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
        }
      }catch(error){
        showError('Error', error.toString());
      }
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await preferences;
    final url = Uri.parse(HttpHelper().getUri('/auth/logout'));
    try{
      final response = await http.post(url, headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));
      print(response.body);
      if(response.statusCode == 200){
        prefs.clear();
        Get.off(const LoginCustomerScreen());
      }else{
        throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
      }
    }catch(error){
      showError('Error', error.toString());
    }
  }
}