import 'dart:convert';

List<Keluhan> keluhanFromJson(String str) => List<Keluhan>.from(json.decode(str).map((x) => Keluhan.fromJson(x)));

String keluhanToJson(List<Keluhan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Keluhan {
  Keluhan({
    required this.idlapor,
    required this.lapor,
    required this.ket,
    required this.stt,
    this.konfirmasi,
    required this.idpengguna,
    this.namalengkap,
    this.nis,
    required this.keluhan,
    required this.tgl,
    required this.respon,
  });

  String idlapor;
  String lapor;
  String ket;
  String stt;
  dynamic konfirmasi;
  String idpengguna;
  dynamic namalengkap;
  dynamic nis;
  String keluhan;
  String tgl;
  String respon;

  factory Keluhan.fromJson(Map<String, dynamic> json) => Keluhan(
    idlapor: json["idlapor"],
    lapor: json["lapor"],
    ket: json["ket"],
    stt: json["stt"],
    konfirmasi: json["konfirmasi"],
    idpengguna: json["idpengguna"],
    namalengkap: json["namalengkap"],
    nis: json["nis"],
    keluhan: json["keluhan"],
    tgl: json["tgl"],
    respon: json["respon"],
  );

  Map<String, dynamic> toJson() => {
    "idlapor": idlapor,
    "lapor": lapor,
    "ket": ket,
    "stt": stt,
    "konfirmasi": konfirmasi,
    "idpengguna": idpengguna,
    "namalengkap": namalengkap,
    "nis": nis,
    "keluhan": keluhan,
    "tgl": tgl,
    "respon": respon,
  };
}
