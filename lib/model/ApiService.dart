import 'dart:convert';

import 'package:silvya/model/keluhan.dart';
import 'package:silvya/model/pengguna.dart';
import 'package:silvya/model/sij.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final String _baseUrl = "http://192.168.137.219/silvya/operatorkantin/index.php/authentication";
  // static final String _baseUrl = "http://192.168.18.139/silvya/operatorkantin/index.php/authentication";

  Future getSij(String id) async {
    final response = await http.get(
        Uri.parse("$_baseUrl/sij?id=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return sijFromJson(response.body.toString());
    } else {
      throw Exception("Data gagal dimuat");
    }
  }

  Future getKeluhan(String id) async {
    final response = await http.get(
        Uri.parse("$_baseUrl/keluhan?id=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return keluhanFromJson(response.body.toString());
    } else {
      throw Exception("Data gagal dimuat");
    }
  }
}