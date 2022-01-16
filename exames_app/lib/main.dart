import 'package:exames_app/ielts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(MaterialApp(
    home: TextToSpeech(),
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

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  bool isSpeaking = false;
  final TextEditingController _controller = TextEditingController();
  final _flutterTts = FlutterTts();

  void initializeTts() {
    _flutterTts.setStartHandler(() {
      setState(() {
        isSpeaking = true;
      });
    });
    _flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
    _flutterTts.setErrorHandler((message) {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeTts();
  }

  void speak() async {
    if (_controller.text.isNotEmpty) {
      await _flutterTts.speak(_controller.text);
    }
  }

  void stop() async {
    await _flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text To Speech"),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            child: TextField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              isSpeaking ? stop() : speak();
            },
            child: Text(isSpeaking ? "Stop" : "Speak"),
          ),
        ],
      ),
    );
  }
}
