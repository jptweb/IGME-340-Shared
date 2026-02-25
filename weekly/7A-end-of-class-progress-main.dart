# HERE IS THE WE GOT UP TO AT THE END OF 7A. (it was actually working in class i just forgot to press Submit!
# Challenge: make it display more infomration from the cart BEYOND just the ID (ex the item price)
                                              
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
  List<Map> cartList = [];

  Future<void> doTheThing() async {
    String url = "https://dummyjson.com/carts";
    

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      List<Map> tempList = [];
      for(final cart in jsonResponse['carts']){
        Map cartData = {
          'userId': cart['userId'],
          'total': cart['total'],
          'products': cart['products'],
        };
        tempList.add(cartData);
      }
      setState(() {
        cartList = tempList;
      });
    }else{
      print("Error: ${response.statusCode} ");
    }

  }

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
              child: Container(
                color:Colors.blueGrey, 
                child: ListView.builder(
                  itemCount: cartList.length,
                  itemBuilder:(context, index) {
                    return ListTile(
                      title: Text('UserID : ${cartList[index]['userId']} '),
                    );
                  },
                )
                
              ),
            )
          ],
        ),
      );
  }
}
