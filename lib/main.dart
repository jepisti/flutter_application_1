import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final List<String> greetings = [
    'Hello Books',
    'Hola Libros',
    'Ciao Libri',
    'हैलो िकताबें',
  ];
  int index = 0;
  late String current;
  void _updateGreeting() {
    setState(() {
      current = greetings[index];
      index = index == (greetings.length - 1) ? 0 : index + 1;
      log("Index number is: $index");
      log("Index number is: $current");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello Books'),
        ),
        body: Column(
          children: [
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(10.0),
              child: loadInternetImage(),
            ),
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(20.0),
              child: loadLocalImage(),
            ),
            Center(
              child: Text(
                greetings[index],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _updateGreeting,
          tooltip: 'Greeting',
          child: const Icon(Icons.insert_emoticon),
        ),
      ),
    );
  }
}

Widget loadLocalImage() {
  return Image.asset('./assets/images/flutter_icon.jpg');
}

Widget loadInternetImage() {
  return Image.network(
      "https://github.com/ptyagicodecamp/flutter_cookbook2/raw/master/assets/flutter_icon.png");
}
