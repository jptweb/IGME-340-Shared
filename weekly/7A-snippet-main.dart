import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  // TODO: We'll build our async function here in class!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Cool App")),
        body: Column(
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                // TODO: We'll make this async and call our function
                print("Button pressed!");
              },
              child: Text("Get Some Data"),
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.blueGrey,
              // In class we'll swap this Container for an Expanded widget
              // and see why that's better than hardcoding a height
            ),
          ],
        ),
    );
  }
}
