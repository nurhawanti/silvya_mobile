// To parse this JSON data, do
//
//     final pengguna = penggunaFromJson(jsonString);

import 'dart:convert';

Pengguna penggunaFromJson(String str) => Pengguna.fromJson(json.decode(str));

String penggunaToJson(Pengguna data) => json.encode(data.toJson());

class Pengguna {
  Pengguna({
    required this.id,
    required this.alamat,
    required this.jabatan,
    required this.nama,
    required this.email,
    required this.prodi,
    required this.username,
    required this.password,
    this.foto,
    required this.nim,
    this.tlp,
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
  dynamic foto;
  String nim;
  dynamic tlp;
  String stt;

  factory Pengguna.fromJson(Map<String, dynamic> json) => Pengguna(
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