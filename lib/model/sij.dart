import 'dart:convert';

List<Sij> sijFromJson(String str) => List<Sij>.from(json.decode(str).map((x) => Sij.fromJson(x)));

String sijToJson(List<Sij> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sij {
  Sij({
    required this.idvcard,
    required this.idizin,
    required this.keterangan,
    required this.stt,
    required this.tgl,
    required this.idalasan,
    required this.pergike,
    required this.tglberangkat,
    required this.jamberangkat,
    required this.tglkembali,
    required this.jamkembali,
    this.ketlain,
    this.idacc,
    this.acc_prodi,
    required this.template,
  });

  String idvcard;
  String idizin;
  String keterangan;
  String stt;
  DateTime tgl;
  String idalasan;
  String pergike;
  DateTime tglberangkat;
  String jamberangkat;
  DateTime tglkembali;
  String jamkembali;
  dynamic ketlain;
  dynamic idacc;
  dynamic acc_prodi;
  String template;

  factory Sij.fromJson(Map<String, dynamic> json) => Sij(
    idvcard: json["idvcard"],
    idizin: json["idizin"],
    keterangan: json["keterangan"],
    stt: json["stt"],
    tgl: DateTime.parse(json["tgl"]),
    idalasan: json["idalasan"],
    pergike: json["pergike"],
    tglberangkat: DateTime.parse(json["tglberangkat"]),
    jamberangkat: json["jamberangkat"],
    tglkembali: DateTime.parse(json["tglkembali"]),
    jamkembali: json["jamkembali"],
    ketlain: json["ketlain"],
    idacc: json["idacc"],
    acc_prodi: json["acc_prodi"],
    template: json["template"],
  );

  Map<String, dynamic> toJson() => {
    "idvcard": idvcard,
    "idizin": idizin,
    "keterangan": keterangan,
    "stt": stt,
    "tgl": "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
    "idalasan": idalasan,
    "pergike": pergike,
    "tglberangkat": "${tglberangkat.year.toString().padLeft(4, '0')}-${tglberangkat.month.toString().padLeft(2, '0')}-${tglberangkat.day.toString().padLeft(2, '0')}",
    "jamberangkat": jamberangkat,
    "tglkembali": "${tglkembali.year.toString().padLeft(4, '0')}-${tglkembali.month.toString().padLeft(2, '0')}-${tglkembali.day.toString().padLeft(2, '0')}",
    "jamkembali": jamkembali,
    "ketlain": ketlain,
    "idacc": idacc,
    "acc_prodi": acc_prodi,
    "template": template,
  };
}
