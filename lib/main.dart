// @dart=2.9
import 'package:flutter/material.dart';
import 'package:silvya/pages/pages.dart';
import 'package:silvya/shared/shared.dart';
import 'dart:async';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silvya',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                WelcomePage()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: thirdColor,
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: defaultMargin),
            children: [
              SizedBox(
                height: 150,
              ),
              Image.asset('assets/images/logo.png', height: 250, width: 300)
            ],
          )
        )
    );
  }
}

