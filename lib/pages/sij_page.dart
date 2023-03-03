part of 'pages.dart';

class SijPage extends StatefulWidget {
  const SijPage({super.key});

  @override
  State<SijPage> createState() => _SijPageState();
}

class _SijPageState extends State<SijPage> {
  late Future data;
  List<Sij> sij = [];
  String id = '211450028';

  @override
  void initState() {
    data = ApiService().getSij(id);
    data.then((value) {
      setState(() {
        sij = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: sij.length == 0?Center(child: CircularProgressIndicator(color: secondaryColor,),)
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
                               Text("Pengajuan SIJ",
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
                                                       _status(sij[index].stt, sij[index].accProdi, sij[index].ketlain),
                                                       style: TextStyle(
                                                           fontSize: 12,
                                                           color: textDark.withOpacity(0.5),
                                                           fontWeight: FontWeight.w400),
                                                     ),SizedBox(
                                                       height: 5,
                                                     ),
                                                     Text(
                                                       "Tanggal Pengajuan: "+format.format(sij[index].tgl),
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
                       Tab(text: 'Menunggu Persetujuan Prodi'),
                       Tab(text: 'Menunggu Persetujuan Akademik'),
                       Tab(text: 'Disetujui'),
                       Tab(text: 'Ditolak'),
                     ],
                   ),
                   Container(
                     height: 350,
                     padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                     child: TabBarView(
                       children: [
                         ListSijPage(status: 'semua',),
                         ListSijPage(status: 'prodi',),
                         ListSijPage(status: 'akademik',),
                         ListSijPage(status: 'disetujui',),
                         ListSijPage(status: 'ditolak',)
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

  String _status($stt, $acc_prodi, $ketlain){
    if($stt == 0 && $acc_prodi == 0){
      return "Izin Meninggalkan Asrama telah Disetujui Kepala Subbagian Akademik dan Kemahasiswaan";
    }else if($stt == 1 && $acc_prodi == 0 && $acc_prodi != null){
      return "Izin Meninggalkan Asrama telah Disetujui Ketua Prodi";
    }else if($stt == 3 && $acc_prodi == 0 && $acc_prodi != null){
      return "Izin Meninggalkan Asrama Menunggu Persetujuan Kepala Subbagian Akademik dan Kemahasiswaan";
    }else if($stt == 1 && $acc_prodi == null){
      return "Menunggu Persetujuan Prodi";
    }else if(($stt == 2 || $acc_prodi == 2) && ($ketlain == null || $ketlain == '')){
      return "Izin Meninggalkan Asrama Ditolak";
    }else{
      if($ketlain.toString() != 'null'){
        return "Izin Meninggalkan Asrama Ditolak Karena "+$ketlain.toString();
      }else{
        return "Izin Meninggalkan Asrama Ditolak";
      }
    }
  }
}
