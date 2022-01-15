import 'package:exames_app/ielts.dart';
import 'package:exames_app/toefl.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exames"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("teofle"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ToeflExames();
                }));
              },
            ),
            ElevatedButton(
              child: Text("ielts"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return IeltsExames();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
