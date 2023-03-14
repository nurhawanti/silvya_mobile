part of 'pages.dart';

class ListSijPage extends StatefulWidget {
  late String status;

  ListSijPage({required this.status});

  @override
  State<ListSijPage> createState() => _ListSijPageState();
}

class _ListSijPageState extends State<ListSijPage> {
  late Future data;
  List<Sij> sij = [];

  @override
  void initState() {
    data = ApiService().getSij();
    data.then((value) {
      setState(() {
        sij = value;

        if(widget.status == 'akademik'){
          sij = sij.where((element) => (element.stt.toString() == '1' || element.stt.toString() == '3') && element.acc_prodi.toString() == '0' && element.acc_prodi.toString() != 'null').toList();
        }else if(widget.status == 'prodi'){
          sij = sij.where((element) => element.stt.toString() == '1' && element.acc_prodi.toString() == 'null').toList();
        }else if(widget.status == 'disetujui'){
          sij = sij.where((element) => element.stt.toString() == '0' && element.acc_prodi.toString() == '0').toList();
        }else if(widget.status == 'ditolak'){
          sij = sij.where((element) => element.stt.toString() == '2' || element.acc_prodi.toString() == '2').toList();
        }else{
          sij = value;
        }

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: sij.length == 0?
      Center(child: Text("Data Tidak Ditemukan"),)
      // Center(child: CircularProgressIndicator(color: secondaryColor,),)
          :
      getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    final format = DateFormat("dd MMMM yyyy");

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: sij.length,
        itemBuilder: (context, index){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
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
                            (sij[index].stt == '0' && sij[index].acc_prodi == '0')?
                            Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                  child:
                                  InkWell(
                                    // onTap: () => downloadFile,
                                    child: Icon(Icons.file_copy_outlined,color: primaryColor, size: 40,)),
                                  )
                            ):
                            SizedBox(
                              width: 0,
                            ),
                            Expanded(
                              child: Container(
                                width: (size.width - 90) * 0.7,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        sij[index].template,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: textDark,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        sij[index].keterangan,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tanggal Berangkat: "+format.format(sij[index].tglberangkat)+" Pukul "+sij[index].jamberangkat.toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Tanggal Kembali: "+format.format(sij[index].tglkembali)+" Pukul "+sij[index].jamkembali.toString(),
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
