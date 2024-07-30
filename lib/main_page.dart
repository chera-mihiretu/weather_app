import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  static String route = "/main_page";

  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text("Hellow World!", textDirection: TextDirection.ltr,),
        ),
      ),
    );
  }
}
