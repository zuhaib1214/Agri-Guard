import 'package:flutter/material.dart';
import 'package:agri_guard/resources/app_color.dart';
import 'package:agri_guard/resources/app_text_styles.dart';
import 'package:agri_guard/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashServices.checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: skinColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Card(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  height: 260,
                  width: 350,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            "assets/images/1.png",
                          ),
                          height: 200,
                          width: 250,
                        ),
                        Text(
                          "Agri Guard",
                          style: primary20BoldTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
