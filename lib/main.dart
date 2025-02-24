import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/supabase_constants.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/myapp.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await GetStorage.init();

  await Di.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );

  // final dbPath = join(await getDatabasesPath(), "smartfin.db");
  // await deleteDatabase(dbPath);
  Get.put(ScreenRedirect(sl()));
  runApp(const MyApp());
}
