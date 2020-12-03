import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSpController extends GetxService {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }
}
