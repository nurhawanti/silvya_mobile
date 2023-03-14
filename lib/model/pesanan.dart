// To parse this JSON data, do
//
//     final pesanan = pesananFromJson(jsonString);

import 'dart:convert';

List<Pesanan> pesananFromJson(String str) => List<Pesanan>.from(json.decode(str).map((x) => Pesanan.fromJson(x)));

String pesananToJson(List<Pesanan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pesanan {
  Pesanan({
    required this.idvcard,
    required this.statusbayar,
    required this.idtempat,
    required this.namaproduk,
    required this.keteranganproduk,
    required this.foto,
    this.idhari,
    required this.idshift,
    required this.idjalur,
    required this.kuota,
  });

  String idvcard;
  String statusbayar;
  String idtempat;
  String namaproduk;
  String keteranganproduk;
  String foto;
  dynamic idhari;
  String idshift;
  String idjalur;
  String kuota;

  factory Pesanan.fromJson(Map<String, dynamic> json) => Pesanan(
    idvcard: json["idvcard"],
    statusbayar: json["statusbayar"],
    idtempat: json["idtempat"],
    namaproduk: json["namaproduk"],
    keteranganproduk: json["keteranganproduk"],
    foto: json["foto"],
    idhari: json["idhari"],
    idshift: json["idshift"],
    idjalur: json["idjalur"],
    kuota: json["kuota"],
  );

  Map<String, dynamic> toJson() => {
    "idvcard": idvcard,
    "statusbayar": statusbayar,
    "idtempat": idtempat,
    "namaproduk": namaproduk,
    "keteranganproduk": keteranganproduk,
    "foto": foto,
    "idhari": idhari,
    "idshift": idshift,
    "idjalur": idjalur,
    "kuota": kuota,
  };
}
