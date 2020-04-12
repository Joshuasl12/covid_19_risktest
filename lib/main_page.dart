import 'package:covid_19_risktest/pertanyaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covid_19_risktest/biodata.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final FocusNode umurFocusNode = FocusNode();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: 650,
            alignment: Alignment.center,
            padding: EdgeInsets.all(50.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Aplikasi Pengecekan Kerentanan Covid-19",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 27),
                  ),
                  SizedBox(
                  height: 20.0,
                ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Nama",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      WhitelistingTextInputFormatter(RegExp("[a-z A-Z]"))
                    ],
                    validator: (value) {
                      if (value.isEmpty) return "Nama kamu harus diisi";
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (val) {
                      FocusScope.of(context).requestFocus(umurFocusNode);
                    },
                    onSaved: (value) {
                      Biodata.nama = value;
                    },
                  ),
                  SizedBox(
                  height: 15.0,
                ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Umur",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 10.0),
                      prefixIcon: Icon(Icons.view_agenda),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    validator: (value) {
                      if (value.isEmpty)
                        return "Umur kamu harus diisi";
                      return null;
                    },
                    focusNode: umurFocusNode,
                    onSaved: (value) {
                      Biodata.umur = int.parse(value);
                    },
                  ),
                  SizedBox(
                  height: 20.0,
                ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 12.5),
                    child: Text(
                      "Mulai",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Pertanyaan();
                        }));
                      }
                    },
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
