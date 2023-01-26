import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
    this.id,
    this.name,
    this.fathername,
    this.depart, 
    this.description,

    {
      super.key,
    });
    final int id;
final String name;
final String fathername;
final String depart;
final String description;

  @override
  State<SecondScreen> createState() => _SecondScreenState(
    id,
    
    name,
    fathername,
    depart,
    description,
  );
}

class _SecondScreenState extends State<SecondScreen> {
  _SecondScreenState(
    this.id,
  
    this.name,
    this.fathername,
    this.depart, 
    this.description,
  );
    final int id;
    
final String name;
final String fathername;
final String depart;
final String description;

Widget textWidget(String context)
{
  return Text(
    context,
    style: const TextStyle(
      fontSize: 20, color: Colors.blueGrey,
    ),
  );
}

@override
  void initState() {
    super.initState();

    print('id= $id');
   
    print('name= $name');
    print('fathername= $fathername');
    print('depart= $depart');
    print('desription= $description');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('$id'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
              name,
              style: const TextStyle
              (fontSize: 20, 
              color: Colors.green),
               ),
              Text(fathername,
              style: const TextStyle(fontSize: 20, 
              color: Colors.green),
              ),],
          ),
          const SizedBox(height: 50),
          Text(depart,
          style: TextStyle(fontSize: 20, color: Colors.black),),
          const SizedBox(height: 50),
          Text(description,
          style: TextStyle(fontSize: 20, color: Colors.black),)
        ],
       ), 
    );
  }
}
