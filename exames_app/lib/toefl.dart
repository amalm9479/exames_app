import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(ToeflExames());
}

class ToeflExames extends StatelessWidget {
  const ToeflExames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("teofl"),
      ),
    );
  }
}
