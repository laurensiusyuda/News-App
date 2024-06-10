import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static GetStorage box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static dynamic read(String key) {
    return box.read(key);
  }

  static Future<void> writeBool(String key, bool value) async {
    await box.write(key, value);
  }

  static bool readBool(String key) {
    return box.read(key) ?? false;
  }
}
