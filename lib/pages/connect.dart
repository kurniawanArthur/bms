import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text("Connect-page", style: TextStyle(color: Colors.white),),
          leading:  IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 15,color: Colors.white,),
            onPressed: () {}),
        ),
        body: const Center(
          child: Column(
            children: <Widget>[
              
            ],
          ),),
      ),
    );
  }
}