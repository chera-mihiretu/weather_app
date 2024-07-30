import 'package:flutter/material.dart';
import 'package:flutter_basics/main_page.dart';

main (){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyApp();

}

class _MyApp extends State<MyApp> {

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      routes: {
        MainPage.route: (context) => MainPage(),
      },
      initialRoute: MainPage.route,
    );
  }
}