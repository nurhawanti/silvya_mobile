part of 'pages.dart';

class MakanPage extends StatefulWidget {
  const MakanPage({super.key});

  @override
  State<MakanPage> createState() => _MakanPageState();
}

class _MakanPageState extends State<MakanPage> {
  late Future data;
  List<Pesanan> pesanan = [];

  @override
  void initState() {
    data = ApiService().getPesanan();
    data.then((value) {
      setState(() {
        pesanan = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: pesanan.length == 0?
      // Center(child: CircularProgressIndicator(color: secondaryColor,),)
      getBodyEmpty()
          :
      getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final format = DateFormat("dd MMMM yyyy");

    return SafeArea(
      child:
      Column(
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Expanded(
            child:
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pesananmu Hari Ini",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: secondaryColor,
                                )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 25,
                                right: 25,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.03),
                                      spreadRadius: 10,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    ),
                                  ]),
                              child:
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, left: 25, right: 10, bottom: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Status Pengajuan SIJ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: primaryColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 20, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                              child: Icon(Icons.file_copy_outlined,color: primaryColor, size: 40,)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: (size.width - 90) * 0.7,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    pesanan[index].namaproduk,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: textDark,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Shift: "+_shift(pesanan[index].idshift),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: textDark.withOpacity(0.5),
                                                        fontWeight: FontWeight.w400),
                                                  ),SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Jalur: "+_jalur(pesanan[index].idjalur),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: textDark.withOpacity(0.8),
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Riwayat Pemesanan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: primaryColor,
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
          DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: primaryColor,
                  unselectedBackgroundColor: whiteColor,
                  unselectedLabelStyle: TextStyle(color: textDark, fontSize: 13, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(color: textLight, fontSize: 13, fontWeight: FontWeight.w600),
                  borderWidth: 1,
                  borderColor: secondaryColor,
                  unselectedBorderColor: thirdColor,
                  radius: 25,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  tabs:
                  [
                    Tab(text: 'Semua'),
                    Tab(text: 'Pagi'),
                    Tab(text: 'Siang'),
                    Tab(text: 'Sore')
                  ],
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  child: TabBarView(
                    children: [
                      ListPesanMakananPage(status: 'Semua',),
                      ListPesanMakananPage(status: 'Pagi',),
                      ListPesanMakananPage(status: 'Siang',),
                      ListPesanMakananPage(status: 'Sore',)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBodyEmpty() {
    var size = MediaQuery.of(context).size;
    final format = DateFormat("dd MMMM yyyy");

    return SafeArea(
      child:
      Column(
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Expanded(
            child:
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pesananmu Hari Ini",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: secondaryColor,
                                )
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                left: 25,
                                right: 25,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.amberAccent.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primaryColor.withOpacity(0.03),
                                      spreadRadius: 10,
                                      blurRadius: 3,
                                      // changes position of shadow
                                    ),
                                  ]),
                              child:
                              Column(
                                children: [
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top: 10, left: 25, right: 10, bottom: 5),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       Text("Status Pengajuan SIJ",
                                  //           style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 20,
                                  //             color: primaryColor,
                                  //           )),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 20, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          child: Center(
                                              child: Icon(Icons.file_copy_outlined,color: primaryColor, size: 40,)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: (size.width - 90) * 0.7,
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Tidak Ada Data",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: textDark,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Shift: ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: textDark.withOpacity(0.5),
                                                        fontWeight: FontWeight.w400),
                                                  ),SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Jalur: ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: textDark.withOpacity(0.8),
                                                        fontWeight: FontWeight.w400),
                                                  ),
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Riwayat Pemesanan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: primaryColor,
                                )),
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ),
          ),
          DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: primaryColor,
                  unselectedBackgroundColor: whiteColor,
                  unselectedLabelStyle: TextStyle(color: textDark, fontSize: 13, fontWeight: FontWeight.w600),
                  labelStyle: TextStyle(color: textLight, fontSize: 13, fontWeight: FontWeight.w600),
                  borderWidth: 1,
                  borderColor: secondaryColor,
                  unselectedBorderColor: thirdColor,
                  radius: 25,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                  tabs:
                  [
                    Tab(text: 'Semua'),
                    Tab(text: 'Pagi'),
                    Tab(text: 'Siang'),
                    Tab(text: 'Sore')
                  ],
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  child: TabBarView(
                    children: [
                      ListPesanMakananPage(status: 'Semua',),
                      ListPesanMakananPage(status: 'Pagi',),
                      ListPesanMakananPage(status: 'Siang',),
                      ListPesanMakananPage(status: 'Sore',)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  String _shift(id){
    if(id == 1){
      return "Pagi";
    }else if(id == 2){
      return "Siang";
    }else if(id == 3){
      return "Sore";
    }else{
      return "Pagi";
    }
  }

  String _jalur(id){
    if(id == 1){
      return "A";
    }else if(id == 2){
      return "B";
    }else{
      return "A";
    }
  }
}
