part of 'pages.dart';

class ListPesanMakananPage extends StatefulWidget {
  late String status;

  ListPesanMakananPage({required this.status});

  @override
  State<ListPesanMakananPage> createState() => _ListPesanMakananPageState();
}

class _ListPesanMakananPageState extends State<ListPesanMakananPage> {
  late Future data;
  List<Pesanan> pesanan = [];

  @override
  void initState() {
    data = ApiService().getPesanan();
    data.then((value) {
      setState(() {
        if(widget.status == 'pagi'){
          pesanan = pesanan.where((element) => element.idshift.toString() == '1').toList();
        }else if(widget.status == 'siang'){
          pesanan = pesanan.where((element) => element.idshift.toString() == '2').toList();
        }else if(widget.status == 'sore'){
          pesanan = pesanan.where((element) => element.idshift.toString() == '3').toList();
        }else{
          pesanan = value;
        }

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: pesanan.length == 0?
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
        itemCount: pesanan.length,
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
                                        pesanan[index].idjalur,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: textDark.withOpacity(0.8),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
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
