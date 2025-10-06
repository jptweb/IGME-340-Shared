import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text("My Cool App")),
        body: Column(
          spacing:20,
          children: [
            ElevatedButton(
              onPressed:() async {
                await doTheThing();
              },
              child:Text("Get Some Data")
            ),
            Expanded(
              child: Container(color:Colors.blueGrey, ),
            )
          ],
        ),
      );
  }
}
