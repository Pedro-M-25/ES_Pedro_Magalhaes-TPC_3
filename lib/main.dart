import 'package:flutter/material.dart';

const String name = 'Pedro';

void main() {
  runApp(const HelloNameApp());
}

class HelloNameApp extends StatelessWidget {

  const HelloNameApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Hello Name App',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.orange,
      ),

      home: const HelloNameHome(),

    );

  }

}

class HelloNameHome extends StatelessWidget {

  const HelloNameHome({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final String greeting = 'Hi! my name is $name';

    return Scaffold(

      appBar: AppBar(
        title: const Text('Hello'),
        centerTitle: true,
      ),

      body: Center(

        child: Text(

          greeting,

          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),

          textAlign: TextAlign.center,

        ),

      ),

    );

  }

}


