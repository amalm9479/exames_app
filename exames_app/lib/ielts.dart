import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors

void main(List<String> args) {
  runApp(IeltsExames());
}

class IeltsExames extends StatelessWidget {
  const IeltsExames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ielts"),
      ),
    );
  }
}
