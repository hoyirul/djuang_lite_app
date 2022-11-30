import 'dart:convert';

import 'package:djuang_lite_app/pickers/color_pickers.dart';
import 'package:djuang_lite_app/pickers/font_pickers.dart';
import 'package:djuang_lite_app/screens/customers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/customers/home/home_screen.dart';
import 'package:djuang_lite_app/screens/drivers/auth/login_screen.dart';
import 'package:djuang_lite_app/screens/drivers/home/home_screen.dart';
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
  TextEditingController passwordConfimationController = TextEditingController();

  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();

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

  Future<void> authLogin(String role) async {
    final url = Uri.parse(HttpHelper().getUri('/auth/login/$role'));
    Map body = {
      'email': emailController.text.trim(),
      'password': passwordController.text
    };

    if(emailController.text == '' || passwordController.text == ''){
      showAlert('Warning', 'Email or Password must be filled!', ColorPicker.warning);
    }else{
      try{
        final response = await http.post(url, body: jsonEncode(body), headers: HeaderHelper().headersUnlogged());
        if(response.statusCode == 200){
          final json = jsonDecode(response.body);
          final SharedPreferences prefs = await preferences;
          prefs.setInt('id', json['data']['user']['id']);
          prefs.setString('access_token', json['data']['access_token']);
          prefs.setString('token_type', json['data']['token_type']);
          prefs.setString('name', json['data']['user']['name']);
          prefs.setString('email', json['data']['user']['email']);
          prefs.setInt('role_id', json['data']['user']['role_id']);
          prefs.setString('address', json['data']['user']['address'] ?? '');
          prefs.setString('image', json['data']['user']['image'] ?? '');

          emailController.clear();
          passwordController.clear();
          (role == 'customer') ? Get.off(const HomeCustomerScreen()) : Get.off(const HomeDriverScreen());
        }else if(response.statusCode == 400){
          throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
        }else{
          throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
        }
      }catch(error){
        showAlert('Error', error.toString(), ColorPicker.danger);
      }
    }
  }

  Future<void> authRegister(String role) async {
    final url = Uri.parse(HttpHelper().getUri('/auth/register/$role'));
    Map body = {
      'name': nameController.text,
      'email': emailController.text.trim(),
      'password': passwordController.text,
      'role_id': (role == 'driver') ? 3 : 4,
    };

    if(emailController.text == '' || passwordController.text == '' || passwordController.text == '' || passwordConfimationController.text == ''){
      showAlert('Warning', 'Name, Email, Password and Confirm Password must be filled!', Colors.amber);
    }else{
      if(passwordConfimationController.text != passwordController.text){
        showAlert('Warning', 'Your password confirmation doesn`t match!', ColorPicker.warning);
      }else{
        try{
          final response = await http.post(url, body: jsonEncode(body), headers: HeaderHelper().headersUnlogged());
          if(response.statusCode == 200){
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            passwordConfimationController.clear();
            (role == 'customer') ? Get.off(const LoginCustomerScreen()) : Get.off(const LoginDriverScreen());
            showAlert('Success', 'your account has been registered and please login!', Colors.green);
          }else if(response.statusCode == 400){
            throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
          }else{
            throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
          }
        }catch(error){
          showAlert('Error', error.toString(), ColorPicker.danger);
        }
      }
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await preferences;
    final url = Uri.parse(HttpHelper().getUri('/auth/logout'));
    try{
      final response = await http.post(url, headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));
      if(response.statusCode == 200){
        prefs.clear();
        Get.off(const LoginCustomerScreen());
      }else{
        throw jsonDecode(response.body)["errors"] ?? "Unknown Error Occured";
      }
    }catch(error){
      showAlert('Error', error.toString(), ColorPicker.danger);
    }
  }
}