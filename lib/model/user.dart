// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    required this.alamat,
    required this.jabatan,
    required this.nama,
    required this.email,
    required this.prodi,
    required this.username,
    required this.password,
    required this.foto,
    required this.nim,
    required this.tlp,
    required this.stt,
  });

  String id;
  String alamat;
  String jabatan;
  String nama;
  String email;
  String prodi;
  String username;
  String password;
  String foto;
  String nim;
  String tlp;
  String stt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    alamat: json["alamat"],
    jabatan: json["jabatan"],
    nama: json["nama"],
    email: json["email"],
    prodi: json["prodi"],
    username: json["username"],
    password: json["PASSWORD"],
    foto: json["foto"],
    nim: json["nim"],
    tlp: json["tlp"],
    stt: json["stt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alamat": alamat,
    "jabatan": jabatan,
    "nama": nama,
    "email": email,
    "prodi": prodi,
    "username": username,
    "PASSWORD": password,
    "foto": foto,
    "nim": nim,
    "tlp": tlp,
    "stt": stt,
  };
}
