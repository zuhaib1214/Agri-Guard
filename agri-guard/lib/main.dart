// Assuming you have 'homescreen.dart' defined

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agri_guard/firebase_options.dart';
import 'package:agri_guard/models/user_model.dart';
import 'package:agri_guard/resources/routes/app_routes.dart';
import 'package:agri_guard/view/splash/splash_screen.dart';
import 'package:agri_guard/view_model/theme/app_theme.dart';

UserModel? localUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      getPages: AppRoutes.routes(),
      home: const SplashScreen(),
    );
  }
}
