import 'package:get_storage/get_storage.dart';

class MyLocalStorage {
  late final GetStorage _storage;

  static MyLocalStorage? _instacnce;

  MyLocalStorage._internal();

  factory MyLocalStorage.instance() {
    _instacnce ??= MyLocalStorage._internal();
    return _instacnce!;
  }

 static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instacnce= MyLocalStorage._internal(); 
    _instacnce!._storage = GetStorage(bucketName);
    }

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
