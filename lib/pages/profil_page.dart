part of 'pages.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    var heightScreen = MediaQuery.of(context).size.height;

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
                          imagePath: user.foto,
                          onPressed: () {},
                        )),
                    SizedBox(height: 30),
                    buildUserInfoDisplay(user.nama, 'Nama', EditNameFormPage(), heightScreen),
                    buildUserInfoDisplay(user.nim, 'NIM', EditNameFormPage(), heightScreen),
                    buildUserInfoDisplay(user.tlp, 'No Telp', EditNameFormPage(), heightScreen),
                    buildUserInfoDisplay(user.email, 'Email', EditNameFormPage(), heightScreen),
                    buildUserInfoDisplay(user.prodi, 'Program Studi', EditNameFormPage(), heightScreen),
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
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage, var heightScreen) =>
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
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisSize: MainAxisSize.min,
                                                        children: [
                                                          SizedBox(height: 20),
                                                          TextField(
                                                            decoration: InputDecoration(
                                                                border: OutlineInputBorder(),
                                                                isDense: true,
                                                                hintText: 'Email',
                                                            ),
                                                            keyboardType: TextInputType.emailAddress,
                                                          ),
                                                          SizedBox(height: 32),
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

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
