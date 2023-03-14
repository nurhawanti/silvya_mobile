part of 'pages.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  // String username = "";
  // String nama = "";
  // String jabatan = "";
  // String prodi = "";
  // String foto = "";
  // String nim = "";
  // String email = "";
  // String tlp = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var notelp = TextEditingController();
  var emailText = TextEditingController();
  late Future data;
  User user = User(id: '', alamat: '', jabatan: '', nama: '', email: '', prodi: '', username: '', password: '', foto: '', nim: '', tlp: '', stt: '');

  @override
  void initState() {
    data = ApiService().getUser();
    data.then((value) {
      setState(() {
        user = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    // getUser();

    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: heightScreen),
          child: Stack(
            children: [
              Container(
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: primaryColor,
                      elevation: 0,
                      toolbarHeight: 10,
                    ),
                    Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 30),
                            child: Text(
                              'Ubah Profil',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ))
                    ),
                    InkWell(
                        onTap: () {
                          navigateSecondPage(EditImagePage());
                        },
                        child: DisplayImage(
                          imagePath: "http://192.168.137.219/silvya/operatorkantin/assets/media/profil/"+user!.foto,
                          onPressed: () {},
                        )),
                    SizedBox(height: 30),
                    buildUserInfoDisplay(user!.nama, 'Nama', heightScreen),
                    buildUserInfoDisplay(user!.nim, 'NIM', heightScreen),
                    buildUserInfoDisplayEdit(user!.tlp, 'No Telp', heightScreen),
                    buildUserInfoDisplayEdit(user!.email, 'Email', heightScreen),
                    buildUserInfoDisplay(user!.prodi, 'Program Studi', heightScreen),
                  ],
                ),
              )
            ],
          )
        ),

      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplayEdit(String getValue, String title, var heightScreen) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: textDark,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              // navigateSecondPage(editPage);
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: thirdColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                                  ),
                                  builder: (context) {
                                    return Scaffold(
                                        body: SingleChildScrollView (
                                            child: ConstrainedBox(
                                                constraints: BoxConstraints(maxHeight: heightScreen),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.all(16),
                                                      child: Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            SizedBox(height: 20),
                                                            TextFormField(
                                                              controller: (title == 'No Telp')?notelp:emailText,
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
                                                                  hintText: getValue,
                                                              ),
                                                              keyboardType: TextInputType.text,
                                                            ),
                                                            SizedBox(height: 32),
                                                            SizedBox(
                                                                width: double.infinity,
                                                                height: 42,
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                  child: ElevatedButton(
                                                                    // onPressed: (){
                                                                    //   Navigator.of(context).pop();
                                                                    // },
                                                                    onPressed: () => _validateInputs(),
                                                                    child: Text(
                                                                      'Simpan',
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
                                                            SizedBox(height: 16),
                                                            SizedBox(
                                                                width: double.infinity,
                                                                height: 42,
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                  child: ElevatedButton(
                                                                    onPressed: (){
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                    child: Text(
                                                                      'Batal',
                                                                      style: whiteTextStyle.copyWith(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: whiteColor),
                                                                    ),
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary: secondaryColor,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                  ),
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                            )
                                        )
                                    );
                                  });
                            },
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4, color: textDark),
                            ))),
                    Icon(
                      Icons.edit,
                      color: primaryColor,
                      size: 20.0,
                    )
                  ]
                  )
              )
            ],
          )
      );

  Widget buildUserInfoDisplay(String getValue, String title, var heightScreen) =>
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: textDark,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: primaryColor,
                            width: 1,
                          ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              getValue,
                              style: TextStyle(fontSize: 16, height: 1.4, color: textDark),
                            ))
                    ),
                  ]
                  )
              )
            ],
          )
      );

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }

  // void getUser() async {
  //   nama = await SessionManager().get("nama");
  //   prodi = await SessionManager().get("prodi");
  //   foto = await SessionManager().get("foto");
  //   email = await SessionManager().get("email");
  //   int temp_tlp = await SessionManager().get("tlp");
  //   int temp_nim = await SessionManager().get("nim");
  //   int temp_username = await SessionManager().get("username");
  //
  //   setState(() {
  //     nama = nama.toString();
  //     prodi = prodi.toString();
  //     foto = foto.toString();
  //     tlp = "$temp_tlp";
  //     email = email.toString();
  //     nim = "$temp_nim";
  //     username = "$temp_username";
  //   });
  // }

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      //If all data are correct then save data to out variables
      _formKey.currentState!.save();

      if(emailText.text != ''){
        bool _isValid = EmailValidator.validate(emailText.text);

        if(_isValid){
          doAjukan(notelp.text, emailText.text);
        }else {
          Navigator.of(_formKey.currentContext!, rootNavigator: false).pop();
          //debugPrint(output['message']);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                  "Email Tidak Valid",
                  style: const TextStyle(fontSize: 16),
                )),
          );
        }
      }else{
        doAjukan(notelp.text, emailText.text);
      }
    }
  }

  doAjukan(notelp, emailText) async {
    final GlobalKey<State> _keyLoader = GlobalKey<State>();
    Dialogs.loading(context, _keyLoader, "Proses ...");
    dynamic id = await SessionManager().get("username");
    var response;

    try {
      if(notelp != ''){
        response = await http.put(
            Uri.parse("http://192.168.137.219/silvya/operatorkantin/index.php/authentication/user"),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "username": id,
              "tlp": notelp.toString()
            })
        );
      }

      if(emailText != ''){
        response = await http.put(
            Uri.parse("http://192.168.137.219/silvya/operatorkantin/index.php/authentication/user"),
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
            body: jsonEncode({
              "username": id,
              "email": emailText.toString()
            })
        );
      }

      final output = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                "Data Berhasil Diubah",
                style: const TextStyle(fontSize: 16),
              )),
        );

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder:(contex)=> ProfilPage(),
          ),
              (route) => false,
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilPage()),
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
