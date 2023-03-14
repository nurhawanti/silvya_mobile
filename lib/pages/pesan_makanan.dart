part of 'pages.dart';

class PesanMakanPage extends StatefulWidget {
  PesanMakanPage({super.key});

  @override
  State<PesanMakanPage> createState() => _PesanMakanPageState();
}

class _PesanMakanPageState extends State<PesanMakanPage> {
  late Future data;
  List<Produk> produk = [];

  @override
  void initState() {
    data = ApiService().getProduk();
    data.then((value) {
      setState(() {
        produk = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: produk.length == 0?Center(child: Text("Data Tidak Ditemukan"),)
          :
      getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    var now = new DateTime.now();
    var format = DateFormat("dd MMMM yyyy");
    String formattedDate = format.format(now);

    return SafeArea(
      child:
      Column(
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Menu Makanan Yang Tersedia",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: secondaryColor,
                    )
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Untuk tanggal: "+formattedDate,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: secondaryColor,
                    )
                ),
              ],
            ),
          ),
          Expanded(
            child:
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: produk.length,
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
                                      flex: 70,
                                      child: Container(
                                        width: (size.width - 90) * 0.7,
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                produk[index].namaproduk,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: textDark,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                produk[index].keteranganproduk,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: textDark.withOpacity(0.8),
                                                    fontWeight: FontWeight.w400),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Jalur: "+produk[index].jalur,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: textDark.withOpacity(0.8),
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Shift: "+produk[index].shift,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: textDark.withOpacity(0.8),
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        width: (size.width - 90) * 0.7,
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment:CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.rectangle,
                                                    image: DecorationImage(
                                                        image: (produk[index].foto != null)? NetworkImage(
                                                            "http://192.168.137.219/silvya/operatorkantin/images/"+produk[index].foto)
                                                            :AssetImage('assets/images/cancel.png') as ImageProvider,
                                                        fit: BoxFit.cover)
                                                ),
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
            )
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
