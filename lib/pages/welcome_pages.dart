part of 'pages.dart';

class WelcomePage extends  StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage>{
  bool _isChecked = true;
  bool _isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    var paddingTop = MediaQuery.of(context).padding.top;
    var paddingBottom = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView (
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: heightScreen),
          child: Stack(
            children: [
              Image.asset(
                  'assets/images/bgn10.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16,
                  top: paddingTop,
                  right: 16,
                  bottom: paddingBottom > 0 ? paddingBottom : 16,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
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
                              hintText: 'Username',
                              suffixIcon: InkWell(
                                onTap: _tooglePasswordView,
                                child: Icon(Icons.email),
                              )
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 16),
                          TextField(
                            obscureText: _isHiddenPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                onTap: _tooglePasswordView,
                                child: Icon(
                                    _isHiddenPassword ?
                                    Icons.visibility_outlined : Icons.visibility_off_outlined
                                ),
                              )
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Checkbox(
                                      value: _isChecked,
                                      checkColor: whiteColor,
                                      activeColor: primaryColor,
                                      onChanged: (value) => setState(() => _isChecked = !_isChecked),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Ingat Saya'),
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: thirdColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                                      ),
                                      builder: (context) {
                                        return Scaffold(
                                            body: SingleChildScrollView (
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints(maxHeight: heightScreen),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.all(16),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Text('Tautan reset password akan dikirim ke alamat email', style: whiteTextStyle.copyWith(
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w500,
                                                            color: textDark),),
                                                            SizedBox(height: 20),
                                                            TextField(
                                                              decoration: InputDecoration(
                                                                  border: OutlineInputBorder(),
                                                                  isDense: true,
                                                                  hintText: 'Email',
                                                                  suffixIcon: InkWell(
                                                                    onTap: _tooglePasswordView,
                                                                    child: Icon(Icons.email),
                                                                  )
                                                              ),
                                                              keyboardType: TextInputType.emailAddress,
                                                            ),
                                                            SizedBox(height: 32),
                                                            SizedBox(
                                                                width: double.infinity,
                                                                height: 42,
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                  child: ElevatedButton(
                                                                    onPressed: (){
                                                                      Navigator.pushReplacement(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) => WelcomePage(),
                                                                          ));
                                                                    },
                                                                    child: Text(
                                                                      'Kirim Email',
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
                                                            SizedBox(height: 16),
                                                            SizedBox(
                                                                width: double.infinity,
                                                                height: 42,
                                                                child: ClipRRect(
                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                  child: ElevatedButton(
                                                                    onPressed: (){
                                                                      Navigator.of(context).pop();
                                                                    },
                                                                    child: Text(
                                                                      'Batal',
                                                                      style: whiteTextStyle.copyWith(
                                                                          fontSize: 20,
                                                                          fontWeight: FontWeight.w500,
                                                                          color: whiteColor),
                                                                    ),
                                                                    style: ElevatedButton.styleFrom(
                                                                        primary: secondaryColor,
                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                  ),
                                                                )
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                )
                                            )
                                        );
                                      });
                                },
                                child: const Text('Lupa Password?'),
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(color: Color(0xFF00BCD4),
                                    fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: 42,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashboardPage(),
                                      ));
                                },
                                child: Text(
                                  'Sign In',
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
                    SizedBox(height: 48),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _tooglePasswordView(){
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }
}

