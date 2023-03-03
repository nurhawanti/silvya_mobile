part of 'pages.dart';

class PengaduanKeluhanPage extends StatefulWidget {
  const PengaduanKeluhanPage({super.key});

  @override
  State<PengaduanKeluhanPage> createState() => _PengaduanKeluhanPageState();
}

class _PengaduanKeluhanPageState extends State<PengaduanKeluhanPage> {
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
                  Text("Form Pengaduan Layanan",
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
                              hintText: 'Pilih Keluhan',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Keluhan',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            maxLines: 8
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
                            //     ));
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
