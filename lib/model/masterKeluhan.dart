// To parse this JSON data, do
//
//     final masterKeluhan = masterKeluhanFromJson(jsonString);

import 'dart:convert';

List<MasterKeluhan> masterKeluhanFromJson(String str) => List<MasterKeluhan>.from(json.decode(str).map((x) => MasterKeluhan.fromJson(x)));

String masterKeluhanToJson(List<MasterKeluhan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterKeluhan {
  MasterKeluhan({
    required this.idmkeluhan,
    required this.keluhan,
    required this.stt,
    required this.namajabatan,
  });

  String idmkeluhan;
  String keluhan;
  String stt;
  String namajabatan;

  factory MasterKeluhan.fromJson(Map<String, dynamic> json) => MasterKeluhan(
    idmkeluhan: json["idmkeluhan"],
    keluhan: json["keluhan"],
    stt: json["stt"],
    namajabatan: json["namajabatan"],
  );

  Map<String, dynamic> toJson() => {
    "idmkeluhan": idmkeluhan,
    "keluhan": keluhan,
    "stt": stt,
    "namajabatan": namajabatan,
  };
}
