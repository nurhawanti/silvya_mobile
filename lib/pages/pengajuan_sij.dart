part of 'pages.dart';

class PengajuanSijPage extends StatefulWidget {
  const PengajuanSijPage({super.key});

  @override
  State<PengajuanSijPage> createState() => _PengajuanSijPageState();
}

class _PengajuanSijPageState extends State<PengajuanSijPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: thirdColor,
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text("Form Pengajuan SIJ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: secondaryColor,
                        )
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'No Telpon',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.phone_android),
                                )
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tanggal Berangkat',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.calendar_month),
                                )
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Jam Berangkat',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.watch_later_outlined),
                                )
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tanggal kembali',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.calendar_month),
                                )
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Jam Kembali',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.watch_later_outlined),
                                )
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Tujuan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.fmd_good_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Keperluan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.filter_frames_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 16),
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                isDense: true,
                                hintText: 'Keterangan',
                                suffixIcon: InkWell(
                                  child: Icon(Icons.filter_frames_outlined),
                                )
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                        width: double.infinity,
                        height: 42,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: ElevatedButton(
                            onPressed: (){
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => DashboardPage(),
                              //     )
                              // );
                            },
                            child: Text(
                              'Ajukan',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
