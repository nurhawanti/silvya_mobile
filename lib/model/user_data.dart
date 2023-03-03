import 'dart:convert';

import 'user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static User myUser = User(
    id: 123456,
    foto:
    "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
    nama: 'Ragil Nurhawanti',
    nim: '15400',
    username: '15400',
    password: '15400',
    tlp: '123456789',
    email: 'test.test@gmail.com',
    prodi: 'Teknik Produksi Migas',
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  // static Future setUser(User user) async {
  //   final json = jsonEncode(user.toJson());
  //
  //   await _preferences.setString(_keyUser, json);
  // }

  // static User getUser() {
  //   final json = _preferences.getString(_keyUser);
  //
  //   return json == null ? myUser : User.fromJson(jsonDecode(json));
  // }
}