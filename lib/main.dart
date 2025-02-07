import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:smartFin/config/routing/screen_redirect.dart';
import 'package:smartFin/core/constants/supabase_constants.dart';
import 'package:smartFin/di.dart';
import 'package:smartFin/myapp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final WidgetsBinding widgetBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );
  await Di.init();
  Get.put(ScreenRedirect(sl(), sl()));
  runApp(const MyApp());
}
