part of 'pages.dart';

class ListKeluhanPage extends StatefulWidget {
  late String status;

  ListKeluhanPage({required this.status});

  @override
  State<ListKeluhanPage> createState() => _ListKeluhanPageState();
}

class _ListKeluhanPageState extends State<ListKeluhanPage> {
  late Future data;
  List<Keluhan> keluhan = [];

  String id = '726';

  @override
  void initState() {
    data = ApiService().getKeluhan(id);
    data.then((value) {
      setState(() {
        keluhan = value;

        if(widget.status != ''){
          keluhan = keluhan.where((element) => element.stt.toString() == widget.status).toList();
        }

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: keluhan.length == 0?Center(child: Text("Data Tidak Ditemukan"),)
          :
      getBody(),
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

  Widget getBody(){
    var size = MediaQuery.of(context).size;

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: keluhan.length,
        itemBuilder: (context, index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    crossAxisAlignment:CrossAxisAlignment.start,
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
                                        keluhan[index].lapor,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Status: "+_status(keluhan[index].stt, keluhan[index].konfirmasi),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tanggal Laporan: "+keluhan[index].tgl.toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
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
            ],
          );
        }
    );
  }
}
