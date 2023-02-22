part of 'pages.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(CupertinoIcons.back,color: black,),
      //   actions: [Icon(CupertinoIcons.search,color: black,)],
      //   backgroundColor: primary,elevation: 0,),
      backgroundColor: thirdColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pengajuan SIJ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: secondaryColor,
                        )),
                    // Text("Semua",
                    //     style: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: 13,
                    //       color: primaryColor,
                    //     )),
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
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 20, right: 20, left: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  // decoration: BoxDecoration(
                                  //   color: arrowbgColor,
                                  //   borderRadius: BorderRadius.circular(15),
                                  //   // shape: BoxShape.circle
                                  // ),
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
                                            "Permohonan Izin Meninggalkan Asrama",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: textDark,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Menunggu Persetujuan Ka Prodi",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: textDark.withOpacity(0.5),
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
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Riwayat Pengajuan",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: primaryColor,
                        )),
                    Text("Semua",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: secondaryColor,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5,bottom: 20,left: 25,right: 25),
                child: Column(children: [
                  Row(children: [
                    Container(
                      padding: EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color:primaryColor, borderRadius: BorderRadius.circular(25),

                      ),
                      child: Center(
                        child: Text(
                          "Menunggu",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color:whiteColor, borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.03),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            )]

                      ),
                      child: Center(
                        child: Text(
                          "Disetujui",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left:25,right: 25,top: 5,bottom: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color:whiteColor, borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.03),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            )]

                      ),
                      child: Center(
                        child: Text(
                          "Ditolak",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],)
                ],),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 5,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 90) * 0.7,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Magang",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: textDark,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Pelaksananaan Mahang/PKL",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Tanggal Pengajuan: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Jl. Mayor Zen Kalidoni Kota Palembang Sumatera Selatn",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Berangkat: 16-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Kembali: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 5,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 90) * 0.7,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Cuti",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: textDark,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Pelaksananaan Mahang/PKL",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Tanggal Pengajuan: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Jl. Mayor Zen Kalidoni Kota Palembang Sumatera Selatn",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Berangkat: 16-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Kembali: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 5,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 90) * 0.7,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sakit",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: textDark,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Pelaksananaan Mahang/PKL",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Tanggal Pengajuan: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Jl. Mayor Zen Kalidoni Kota Palembang Sumatera Selatn",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Berangkat: 16-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Kembali: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 5,
                              left: 25,
                              right: 25,
                            ),
                            decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.03),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: (size.width - 90) * 0.7,
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Liburan",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: textDark,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Pelaksananaan Mahang/PKL",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Tanggal Pengajuan: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.8),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Jl. Mayor Zen Kalidoni Kota Palembang Sumatera Selatn",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Berangkat: 16-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Kembali: 18-February-2023 20:00",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: textDark.withOpacity(0.5),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
