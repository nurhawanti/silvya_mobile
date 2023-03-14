import 'dart:convert';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:silvya/model/keluhan.dart';
import 'package:silvya/model/masterKeluhan.dart';
import 'package:silvya/model/pengguna.dart';
import 'package:silvya/model/pesanan.dart';
import 'package:silvya/model/produk.dart';
import 'package:silvya/model/sij.dart';
import 'package:http/http.dart' as http;
import 'package:silvya/model/user.dart';

class ApiService {
  static final String _baseUrl = "http://192.168.18.139/silvya/operatorkantin/index.php/authentication";

  Future getUser() async {
    dynamic id = await SessionManager().get("username");

    final response = await http.get(
        Uri.parse("$_baseUrl/user?username=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return userFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }

  Future getSij() async {
    dynamic id = await SessionManager().get("username");

    final response = await http.get(
        Uri.parse("$_baseUrl/sij?id=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return sijFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }

  Future getKeluhan() async {
    dynamic id = await SessionManager().get("id");

    final response = await http.get(
        Uri.parse("$_baseUrl/keluhan?id=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return keluhanFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }

  Future getPesanan() async {
    dynamic id = await SessionManager().get("id");

    final response = await http.get(
        Uri.parse("$_baseUrl/makan?id=$id"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return pesananFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }

  Future getMasterKeluhan() async {
    dynamic id = await SessionManager().get("username");

    final response = await http.get(
        Uri.parse("$_baseUrl/masterKeluhan"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return masterKeluhanFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }

  Future getProduk() async {
    final response = await http.get(
        Uri.parse("$_baseUrl/produk"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
    );

    if (response.statusCode == 200) {
      return produkFromJson(response.body.toString());
    }else if (response.statusCode == 400) {
      return "Data Tidak Ditemukan";
    } else {
      throw Exception("Data Gagal Dimuat");
    }
  }
}