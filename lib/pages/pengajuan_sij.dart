part of 'pages.dart';

class PengajuanSijPage extends StatefulWidget {
  const PengajuanSijPage({super.key});

  @override
  State<PengajuanSijPage> createState() => _PengajuanSijPageState();
}

class _PengajuanSijPageState extends State<PengajuanSijPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var notelp = TextEditingController();
  var tglberangkat = TextEditingController();
  var tglkembali = TextEditingController();
  var jamberangkat = TextEditingController();
  var jamkembali = TextEditingController();
  var tujuan = TextEditingController();
  var keperluan = TextEditingController();
  var keterangan = TextEditingController();
  var attachfile = TextEditingController();
  var filePickerVal = File("");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: thirdColor,
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text("Form Pengajuan SIJ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: secondaryColor,
                        )
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                          children: [
                            TextFormField(
                              controller: notelp,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'No Telpon',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.phone_android),
                                )
                              ),
                              keyboardType: TextInputType.phone,
                              onSaved: (String? val) {
                                notelp.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: tglberangkat,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tanggal Berangkat',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.calendar_month),
                                )
                              ),
                              readOnly: true,
                              onTap: () async{
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2025)
                                );

                                if(pickedDate != null ){
                                  // print(pickedDate);
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                  // print(formattedDate);
                                  setState(() {
                                    tglberangkat.text = formattedDate;
                                  });
                                }else{
                                  print("Tanggal Belum Terpilih");
                                }
                              },
                              onSaved: (String? val) {
                                tglberangkat.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: jamberangkat,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Jam Berangkat',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.watch_later_outlined),
                                )
                              ),
                              readOnly: true,
                              onTap: () async{
                                TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                );

                                if(pickedTime != null ){
                                  // print(pickedDate);
                                  String formattedDate = "${pickedTime.hour}:${pickedTime.minute}";;
                                  // print(formattedDate);
                                  setState(() {
                                    jamberangkat.text = formattedDate;
                                  });
                                }else{
                                  print("Jam Belum Terpilih");
                                }
                              },
                              onSaved: (String? val) {
                                jamberangkat.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: tglkembali,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tanggal kembali',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.calendar_month),
                                )
                              ),
                              readOnly: true,
                              onTap: () async{
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate:DateTime.now(), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2025)
                                );

                                if(pickedDate != null ){
                                  // print(pickedDate);
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                  // print(formattedDate);
                                  setState(() {
                                    tglkembali.text = formattedDate;
                                  });
                                }else{
                                  print("Tanggal Belum Terpilih");
                                }
                              },
                              onSaved: (String? val) {
                                tglkembali.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: jamkembali,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'Jam Kembali',
                                  suffixIcon: InkWell(
                                    child: Icon(Icons.watch_later_outlined),
                                  )
                              ),
                              readOnly: true,
                              onTap: () async{
                                TimeOfDay? pickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()
                                );

                                if(pickedTime != null ){
                                  // print(pickedDate);
                                  String formattedDate = "${pickedTime.hour}:${pickedTime.minute}";;
                                  // print(formattedDate);
                                  setState(() {
                                    jamkembali.text = formattedDate;
                                  });
                                }else{
                                  print("Jam Belum Terpilih");
                                }
                              },
                              onSaved: (String? val) {
                                jamkembali.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: tujuan,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tujuan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.fmd_good_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (String? val) {
                                tujuan.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: keperluan,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Keperluan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.filter_frames_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (String? val) {
                                keperluan.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: keterangan,
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data Tidak Boleh Kosong';
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Keterangan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.filter_frames_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                              onSaved: (String? val) {
                                keterangan.text = val!;
                              },
                            ),
                            SizedBox(height: 16),
                            buildFilePicker(),
                          ]
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(
                            onPressed: () => _validateInputs(),
                            child: Text(
                              'Ajukan',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

  Widget buildFilePicker() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                readOnly: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'File harus diupload';
                  } else {
                    return null;
                  }
                },
                controller: attachfile,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: Colors.white, width: 2)),
                  hintText: 'Unggah File Lampiran',
                  contentPadding: EdgeInsets.all(10.0),
                ),
                style: const TextStyle(fontSize: 16.0)),
          ),
          const SizedBox(width: 5),
          ElevatedButton.icon(
            icon: const Icon(
              Icons.upload_file,
              color: Colors.white,
              size: 24.0,
            ),
            label: const Text('Pilih File', style: TextStyle(fontSize: 16.0)),
            onPressed: () {
              selectFile();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              minimumSize: const Size(122, 48),
              maximumSize: const Size(122, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      setState(() {
        attachfile.text = result.files.single.name;
        filePickerVal = File(result.files.single.path.toString());
      });
    } else {
      // User canceled the picker
    }
  }

  simpan(notelp, tglberangkat, tglkembali, jamberangkat, jamkembali, tujuan, keperluan, keterangan) async {
    final String nama = attachfile.text;
    // var rawTgl = txtDate.text.split("/");
    // var yM = rawTgl[2];
    // var mM = rawTgl[1];
    // var dM = rawTgl[0];
    // final String tgl = yM + "-" + mM + "-" + dM;

    try {
      //post date
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://api.sobatcoding.com/testing/upload'));

      request.headers.addAll(headers);
      // request.fields['nama'] = nama;
      // request.fields['tgl'] = tgl;

      request.files.add(http.MultipartFile('file',
          filePickerVal!.readAsBytes().asStream(), filePickerVal!.lengthSync(),
          filename: filePickerVal!.path.split("/").last));

      var res = await request.send();
      var responseBytes = await res.stream.toBytes();
      var responseString = utf8.decode(responseBytes);

      //debug
      debugPrint("response code: " + res.statusCode.toString());
      debugPrint("response: " + responseString.toString());

      final dataDecode = jsonDecode(responseString);
      debugPrint(dataDecode.toString());

      if (res.statusCode == 200) {

        return showDialog<void>(
          context: context,
          barrierDismissible: false, // user must tap button!
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Informasi'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: const <Widget>[
                    Text(
                        "File berhasil diupload"),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    //
                    Navigator.of(context, rootNavigator: false).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {

      }
    } catch (e) {
      debugPrint('$e');

    }
  }

  doAjukan(notelp, tglberangkat, tglkembali, jamberangkat, jamkembali, tujuan, keperluan, keterangan, filePickerVal) async {
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    Dialogs.loading(context, _keyLoader, "Proses ...");
    dynamic id = await SessionManager().get("username");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final response = http.MultipartRequest('POST', Uri.parse('http://192.168.137.219/silvya/operatorkantin/index.php/authentication/sij'));
      // final response = await http.MultipartRequest('POST',
      //     Uri.parse("http://192.168.137.219/silvya/operatorkantin/index.php/authentication/sij"),
      //     headers: {'Content-Type': 'application/json; charset=UTF-8'},
      //     body: jsonEncode({
      //       "idvcard": id,
      //       "keterangan": keterangan,
      //       "telp": notelp,
      //       "idalasan": keperluan,
      //       "pergike": keterangan,
      //       "tglberangkat": tglberangkat,
      //       "jamberangkat": jamberangkat,
      //       "tglkembali": tglkembali,
      //       "jamkembali": jamkembali,
      //       "file": filePickerVal,
      //     })
      // );
      response.headers.addAll(headers);
      response.fields["idvcard"] = id.toString();
      response.fields["keterangan"] = keterangan.toString();
      response.fields["telp"] = notelp.toString();
      response.fields["idalasan"] = keperluan.toString();
      response.fields["pergike"] = keterangan.toString();
      response.fields["tglberangkat"] = tglberangkat.toString();
      response.fields["jamberangkat"] = jamberangkat.toString();
      response.fields["tglkembali"] = tglkembali.toString();
      response.fields["jamkembali"] = jamkembali.toString();

      response.files.add(http.MultipartFile('file',
          filePickerVal!.readAsBytes().asStream(), filePickerVal!.lengthSync(),
          filename: attachfile.text));

      var output = await response.send();

      // final output = jsonDecode(value.stream.toString());

      if (output.statusCode == 200) {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                "Data Berhasil Dikirim",
                style: const TextStyle(fontSize: 16),
              )),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder:(contex)=> SijPage(),
          ),
              (route) => false,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SijPage()),
        );
      } else {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
        //debugPrint(output['message']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                output.stream.toString(),
                style: const TextStyle(fontSize: 16),
              )),
        );
      }
    } catch (e) {
      Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
      Dialogs.popUp(context, '$e');
      debugPrint('$e');
    }
  }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();
      doAjukan(notelp.text, tglberangkat.text, tglkembali.text, jamberangkat.text, jamkembali.text, tujuan.text, keperluan.text, keterangan.text, filePickerVal);
    }
  }
}
