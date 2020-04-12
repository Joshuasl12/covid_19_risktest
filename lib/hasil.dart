import 'package:covid_19_risktest/biodata.dart';
import 'package:covid_19_risktest/main_page.dart';
import 'package:flutter/material.dart';

class Hasil extends StatelessWidget {
  Map<int, bool> answers;
  @override
  Widget build(BuildContext context) {
    answers = ModalRoute.of(context).settings.arguments as Map<int, bool>;
    int yesAnswer = answers.values.where((bool answer) => answer).length;
    String result;

    if (yesAnswer <= 7) {
      result = "Rendah";
    } else if (yesAnswer <= 14) {
      result = "Sedang";
    } else if (yesAnswer > 14) {
      result = "Tinggi";
    }
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50.0),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Biodata.nama,
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "Resiko anda untuk tertular penyakit COVID-19 adalah ",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.normal),
                    children: <TextSpan>[
                      TextSpan(
                          text: result,
                          style: Theme.of(context).textTheme.title),
                    ],
                  ),
                )
              ],
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.5),
              child: Text(
                "Cek Lagi",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainPage();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
