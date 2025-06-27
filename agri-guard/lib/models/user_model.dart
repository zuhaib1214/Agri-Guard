// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:auto_motive/Data/shared%20pref/shared_pref.dart';
import 'package:agri_guard/data/shared/shared_pref.dart';

class UserModel {
  final String? name;
  final String? token;
  final String? email;
  final String? profilePicture;

  UserModel({
    required this.name,
    required this.token,
    required this.email,
    this.profilePicture,
  });

  UserModel copyWith(
      {String? name,
      String? phoneNumber,
      String? token,
      String? email,
      String? profilePicture,
      double? longitude,
      double? latitude,
      List<dynamic>? myServices,
      List<dynamic>? mySpareParts}) {
    final UserModel userModel = UserModel(
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      token: token ?? this.token,
      email: email ?? this.email,
    );
    UserPref.setUser(user: userModel);
    return userModel;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'token': token,
      'email': email,
      'profilePicture': profilePicture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
    );
  }
}
