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
    var url = Uri.parse(HttpHelper().getUri('/schedules/driver/$id'));

    final response = await http.get(url, headers: HeaderHelper().headersLogged(prefs.getString('token_type'), prefs.getString('access_token')));
    try{
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200){
        var decodeJson = json.decode(response.body)['data'];
        var jsonString = json.encode(decodeJson);
        return scheduleModelFromJson(jsonString);
      }else if(response.statusCode == 204){
        throw 'You don`t have a schedule yet';
      }

    }catch(error){
      Get.back();
      
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text((response.statusCode == 204) ? 'Information' : 'Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(error.toString())],
            );
          });
    }
    return null;
  }
}