import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<int?> getId() async {
    final prefs = await _prefs;
    return prefs.getInt('id');
  }
  
  Future<String?> getAccessToken() async {
    final prefs = await _prefs;
    return prefs.getString('access_token');
  }

  Future<String?> getTokenType() async {
    final prefs = await _prefs;
    return prefs.getString('token_type');
  }

  Future<String?> getName() async {
    final prefs = await _prefs;
    return prefs.getString('name');
  }

  Future<String?> getEmail() async {
    final prefs = await _prefs;
    return prefs.getString('email');
  }

  Future<int?> getRoleId() async {
    final prefs = await _prefs;
    return prefs.getInt('role_id');
  }

  Future<String?> getAddress() async {
    final prefs = await _prefs;
    return prefs.getString('address');
  }

  Future<String?> getImage() async {
    final prefs = await _prefs;
    return prefs.getString('image');
  }
}