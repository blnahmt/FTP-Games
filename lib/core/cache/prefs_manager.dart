import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  late final SharedPreferences prefs;
  PrefsManager._();
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static PrefsManager instance = PrefsManager._();

  Future<void> saveBool(PrefsSetting key, bool val) async {
    await prefs.setBool(key.name, val);
  }

  bool? getBool(PrefsSetting key) {
    return prefs.getBool(key.name);
  }
}

enum PrefsSetting { theme }
