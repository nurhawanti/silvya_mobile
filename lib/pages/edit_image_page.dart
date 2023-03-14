import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:silvya/widget/appbar_widget.dart';
import 'package:image_picker/image_picker.dart';

class EditImagePage extends StatefulWidget {
  const EditImagePage({Key? key}) : super(key: key);

  @override
  _EditImagePageState createState() => _EditImagePageState();
}

class _EditImagePageState extends State<EditImagePage> {
  // var user = UserData.myUser;
  String username = "";
  String nama = "";
  String jabatan = "";
  String prodi = "";
  String foto = "";
  String nim = "";
  String email = "";
  String tlp = "";
  File newFoto= new File('');
  String location = "";

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              width: 330,
              child: const Text(
                "Ubah Foto Profil Anda:",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 330,
                  child: GestureDetector(
                    onTap: () async {
                      _getFromGallery();
                    },
                    child: (foto != null)?(location != '')?Image.file(newFoto):Image.network("http://192.168.137.219/silvya/operatorkantin/assets/media/profil/$foto")
                    :Image.asset('assets/images/akun.png'),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Simpan',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }

  void getUser() async {
    nama = await SessionManager().get("nama");
    prodi = await SessionManager().get("prodi");
    foto = await SessionManager().get("foto");
    email = await SessionManager().get("email");
    int temp_tlp = await SessionManager().get("tlp");
    int temp_nim = await SessionManager().get("nim");
    int temp_username = await SessionManager().get("username");

    setState(() {
      nama = nama.toString();
      prodi = prodi.toString();
      foto = foto.toString();
      tlp = "$temp_tlp";
      email = email.toString();
      nim = "$temp_nim";
      username = "$temp_username";
    });
  }

  /// Get from gallery
  _getFromGallery() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(image == null) return;

        final imageTemp = File(image.path);
        // setState(() => newFoto = imageTemp);
        setState(() {
          newFoto = imageTemp;
          location = image.path.toString();
        });
      } on PlatformException catch(e) {
        print('Gagal Mengunggah Gambar: $e');
      }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        newFoto = File(pickedFile.path);
      });
    }
  }
}