import 'package:covid_19_risktest/main_page.dart';
import 'package:covid_19_risktest/pertanyaan.dart';
import 'package:covid_19_risktest/hasil.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (ctx) => MainPage(),
        "Pertanyaan": (ctx) => Pertanyaan(),
        "Hasil": (ctx) => Hasil(),
      },
    );
  }
}