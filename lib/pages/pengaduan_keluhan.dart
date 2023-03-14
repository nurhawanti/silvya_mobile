part of 'pages.dart';

class PengaduanKeluhanPage extends StatefulWidget {
  const PengaduanKeluhanPage({super.key});

  @override
  State<PengaduanKeluhanPage> createState() => _PengaduanKeluhanPageState();
}

class _PengaduanKeluhanPageState extends State<PengaduanKeluhanPage> {
  late Future data;
  List<MasterKeluhan> mk = [];
  String? selectedValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var idmkeluhan = TextEditingController();
  var keluhan = TextEditingController();

  @override
  void initState() {
    data = ApiService().getMasterKeluhan();
    data.then((value) {
      setState(() {
        mk = value;
      });
    });
    super.initState();
  }

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
                  Text("Form Pengaduan Layanan",
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
                          DropdownButtonFormField2(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Pilih Kategori Keluhan',
                              style: TextStyle(fontSize: 16),
                            ),
                            items: mk.map((item) => DropdownMenuItem<String>(
                              value: item.idmkeluhan,
                              child: Text(
                                item.keluhan,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: textDark),
                              ),
                            )).toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Please select gender.';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              selectedValue = value.toString();
                            },
                            onSaved: (value) {
                              idmkeluhan.text = value.toString()!;
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 60,
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                            iconStyleData: const IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xFF263238),
                              ),
                              iconSize: 30,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Keluhan',
                              hintStyle: whiteTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: textDark)
                            ),
                            keyboardType: TextInputType.text,
                            maxLines: 8,
                            controller: keluhan,
                            onSaved: (String? val) {
                              keluhan.text = val!;
                            },
                          ),
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
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DashboardPage(),
                            //     ));
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

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();
      doAjukan(idmkeluhan.text, keluhan.text);
    }
  }

  doAjukan(idmkeluhan, keluhan) async {
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    Dialogs.loading(context, _keyLoader, "Proses ...");
    dynamic id = await SessionManager().get("id");

    try {
      final response = await http.post(
          Uri.parse("http://192.168.137.219/silvya/operatorkantin/index.php/authentication/keluhan"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "id": idmkeluhan,
            "idpengguna": id.toString(),
            "keluhan": keluhan,
          })
      );

      final output = jsonDecode(response.body);

      if (response.statusCode == 200) {
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
            builder:(contex)=> KeluhanPage(),
          ),
              (route) => false,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => KeluhanPage()),
        );
      } else {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
        //debugPrint(output['message']);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                output.toString(),
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
}
