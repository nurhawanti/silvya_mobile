part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int pageIndex = 0;
  List<Widget> pages = [
    HomePage(),
    KeluhanPage(),
    SijPage(),
    MakanPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: thirdColor,
      body: getBody(),
      bottomNavigationBar: getFooter(),
      floatingActionButton: SafeArea(
        child: SizedBox(
          // height: 30,
          // width: 40,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                  ),
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(CupertinoIcons.doc_on_doc_fill),
                          title: Text('Pengajuan SIJ'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PengajuanSijPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                          title: Text('Pengaduan Layanan'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PengaduanKeluhanPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.fastfood_outlined),
                          title: Text('Pesan Makanan'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PesanMakanPage()),
                            );
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Icon(
              CupertinoIcons.plus,
              size: 40,
            ),
            backgroundColor: secondaryColor,
            // shape:
            //     BeveledRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      CupertinoIcons.home,
      CupertinoIcons.pencil_ellipsis_rectangle,
      CupertinoIcons.doc_on_doc_fill,
      CupertinoIcons.book,
    ];

    return AnimatedBottomNavigationBar(
        backgroundColor: primaryColor,
        icons: iconItems,
        splashColor: secondaryColor,
        inactiveColor: thirdColor.withOpacity(1),
        activeColor: blueGray.withOpacity(1),
        gapLocation: GapLocation.center,
        activeIndex: pageIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 32,
        rightCornerRadius: 10,
        elevation: 2,
        onTap: (index) {
          setTabs(index);
        });
  }

  setTabs(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
