// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

List<Produk> produkFromJson(String str) => List<Produk>.from(json.decode(str).map((x) => Produk.fromJson(x)));

String produkToJson(List<Produk> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Produk {
  Produk({
    required this.idproduk,
    required this.namaproduk,
    required this.keteranganproduk,
    required this.statusproduk,
    required this.foto,
    required this.kuota,
    required this.alias,
    required this.jalur,
    required this.shift,
  });

  String idproduk;
  String namaproduk;
  String keteranganproduk;
  String statusproduk;
  String foto;
  String kuota;
  String alias;
  String jalur;
  String shift;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    idproduk: json["IDPRODUK"],
    namaproduk: json["NAMAPRODUK"],
    keteranganproduk: json["KETERANGANPRODUK"],
    statusproduk: json["STATUSPRODUK"],
    foto: json["foto"],
    kuota: json["kuota"],
    alias: json["alias"],
    jalur: json["jalur"],
    shift: json["shift"],
  );

  Map<String, dynamic> toJson() => {
    "IDPRODUK": idproduk,
    "NAMAPRODUK": namaproduk,
    "KETERANGANPRODUK": keteranganproduk,
    "STATUSPRODUK": statusproduk,
    "foto": foto,
    "kuota": kuota,
    "alias": alias,
    "jalur": jalur,
    "shift": shift,
  };
}
