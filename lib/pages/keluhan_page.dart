part of 'pages.dart';

class KeluhanPage extends StatefulWidget {
  const KeluhanPage({super.key});

  @override
  State<KeluhanPage> createState() => _KeluhanPageState();
}

class _KeluhanPageState extends State<KeluhanPage> {
  late Future data;
  List<Keluhan> keluhan = [];

  String id = '726';

  @override
  void initState() {
    data = ApiService().getKeluhan(id);
    data.then((value) {
      setState(() {
        keluhan = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: keluhan.length == 0?Center(child: CircularProgressIndicator(color: secondaryColor,),)
          :
      getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;

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
                            Text("Pengaduan Layanan",
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
                                        Text("Status Pengaduan Layanan",
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
                                                    keluhan[index].keluhan,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: textDark,
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Status: "+_status(keluhan[index].stt, keluhan[index].konfirmasi),
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: textDark.withOpacity(0.5),
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    "Tanggal Laporan: "+keluhan[index].tgl.toString(),
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
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Riwayat Pengajuan",
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
            length: 5,
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
                    Tab(text: 'Menunggu Konfirmasi'),
                    Tab(text: 'Proses Tindak Lanjut'),
                    Tab(text: 'Selesai'),
                    Tab(text: 'Ditolak'),
                  ],
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  child: TabBarView(
                    children: [
                      ListKeluhanPage(status: '',),
                      ListKeluhanPage(status: '',),
                      ListKeluhanPage(status: '3',),
                      ListKeluhanPage(status: '2',),
                      ListKeluhanPage(status: '4',),
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

  String _status($stt, $konfirmasi){
    if($stt == 2){
      return "Selesai";
    }else if($stt == 4){
      return "Laporan Ditolak";
    }else if($stt == 3){
      return "Proses Tindak Lanjut";
    }else{
      return "Menunggu Konfirmasi";
    }
  }
}
