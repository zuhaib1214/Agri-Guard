import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:agri_guard/models/user_model.dart';
import 'package:agri_guard/resources/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static Future<void> setUser({required UserModel user}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('NAME', user.name.toString());
    pref.setString('EMAIL', user.email.toString());
    pref.setString('TOKEN', user.token.toString());
    pref.setString('PROFILEPICTURE', user.profilePicture.toString());
  }

  static Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return UserModel(
      name: pref.getString('NAME').toString(),
      profilePicture: pref.getString('PROFILEPICTURE'),
      token: pref.getString('TOKEN').toString(),
      email: pref.getString('EMAIL').toString(),
    );
  }

  static Future<void> removeUser() async {
    FirebaseAuth.instance.signOut();
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    Get.offAllNamed(Routes.getStarted);
  }
}
