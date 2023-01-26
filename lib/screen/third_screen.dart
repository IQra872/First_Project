import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class thirdscreen extends StatefulWidget {
  const thirdscreen({super.key});

  @override
  State<thirdscreen> createState() => _thirdscreenState();
}

class _thirdscreenState extends State<thirdscreen> {
  List products= [];

  Future <void> getAPIcall()async {
      var url = Uri.parse('https://randomuser.me/api/');
      var response = await http.get(url);
      var data = await json.decode(response.body);
      setState(() {
        products = data['products'];
      } );
  }
 @override
  void initState(){ 
    super.initState();
    getAPIcall();

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(fontSize: 20,
          color: Colors.blueGrey),
        ),
          backgroundColor: Colors.grey,
        ),
       body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightGreen[200],
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage('assets/test.jpg'),
            opacity: 0.1,
            fit: BoxFit.fill,
            )
          ),
          
          child: (
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 const Text(
                  'Name: ',
                  style: TextStyle(fontSize: 30, color: Colors.blueAccent),
                ),
                Text(
                      '${products [0] }',
                       style: TextStyle(
                        fontSize: 20,
                       ),
                ),
              ],
            ) 
          )

      ),
    );

  }
}