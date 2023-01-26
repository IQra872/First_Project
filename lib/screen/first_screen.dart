import 'dart:convert';
import 'package:first_f/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int id = 1;
  List studentsInfo = [];
  List products = [];
  Future <void> readJson() async{
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    setState(() {
      studentsInfo = data["studentsInfo"];
    });
  }
    
   Future <void> getAPIcall()async {
      var url = Uri.parse('https://dummyjson.com/products');
      var response = await http.get(url);
      var data = await json.decode(response.body);
      setState(() {
        products= data['products'];
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
        title: const Text('Fultter First',
        style: TextStyle(fontSize: 18, color: Colors.black,
       fontWeight: FontWeight.bold),
       ),
        centerTitle: true,
      ),
      body: ListView.builder( 
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              GestureDetector(
                //onTap: (){
                  //Navigator.push(context, MaterialPageRoute ( builder: (context) => SecondScreen(
                    //studentsInfo[index]['id'],
                    //studentsInfo[index]['name'],
                    //studentsInfo[index]['fathername'],
                    //studentsInfo[index]['depart'],
                    //studentsInfo[index]['description'],
                  //),
                  //),
                  //);
                //},
                child: ListTile(
                  leading:  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 30,
                    child: CachedNetworkImage( imageUrl: '${products[index]['thumbnail']}')
                   // child: Image.network('${products[index]['thumbnail']}')
                  ),
                  title: Text ('${products[index]['title']}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  subtitle: Text ('${products[index]['brand']}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                   trailing: const Icon(Icons.chevron_right,
                   color: Colors.black,),
                ),
              ),
              const Divider(
                color: Colors.black,
                thickness: 2,
              ),
              // ListTile( leading: Text( '${studentsInfo[index]['id']}'),),
            ],
          );
        },
      ),
    );
  }
}