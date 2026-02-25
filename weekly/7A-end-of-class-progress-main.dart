/*
HERE IS THE WE GOT UP TO AT THE END OF 7A. (it was actually working in class i just forgot to press Submit!
Challenge: make it display more infomration from the cart BEYOND just the ID (ex the item price)

PS I forgot to cover initState to load stuff on app load i will cover that at start of class 7B
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // TODO: We'll build our async function here in class!

  List<Map<String, dynamic>> cartList = [];

  Future<void> doTheThing() async {
    print("function called");

    String url = "https://dummyjson.com/carts";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> tempList = [];

      var jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);

      for (final cart in jsonResponse['carts']) {
        tempList.add({
          'userId': cart['userId'],
          'total': cart['total'],
          'products': cart['products'],
        });
      }

      setState(() {
        cartList = tempList;
      });

      print(cartList);
    } else {
      print("Error ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cool App")),
      body: Column(
        spacing: 20,
        children: [
          ElevatedButton(
            onPressed: () async {
              // TODO: We'll make this async and call our function
              await doTheThing();
              print("Button pressed!");
            },
            child: Text("Get Some Data"),
          ),
          Expanded(
            child: Container(

              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder:(context, index) {
                  return ListTile(
                    tileColor:Colors.amber,
                    title: Text("User ID: ${cartList[index]['userId']}"),
                    subtitle: Text("Products: ${cartList[index]['products'].length}"),
                    trailing: Text(" \$ ${cartList[index]['total']}"),
                  );
                },
              ),
              // In class we'll swap this Container for an Expanded widget
              // and see why that's better than hardcoding a height
            ),
          ),
        ],
      ),
    );
  }
}


                                              
