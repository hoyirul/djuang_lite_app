import 'dart:convert';

import 'package:djuang_lite_app/models/schedule_model.dart';
import 'package:djuang_lite_app/utils/header_helpers.dart';
import 'package:djuang_lite_app/utils/http_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ScheduleController extends GetxController{
  final isLoading = true.obs;
  final scheduleList = <ScheduleModel>[].obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit(){
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try{
      isLoading(true);
      var schedules = await getList();
      if(schedules != null){
        scheduleList.assignAll(schedules);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<List<ScheduleModel>?> getList() async {
    final prefs = await _prefs;
    var id = prefs.getInt('id');
    try{
      var url = Uri.parse(HttpHelper().getUri('/schedules/customer/$id'));

      final response = await http.get(url, headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));

      print(response.statusCode);
      print(jsonDecode(response.body));

      if(response.statusCode == 200){
        var decodeJson = json.decode(response.body)['data'];
        var jsonString = json.encode(decodeJson);
        return scheduleModelFromJson(jsonString);
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
}