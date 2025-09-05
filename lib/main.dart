import 'package:ben_folio/pages/main_page.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(system: System()));
}

class MyApp extends StatelessWidget {
  final System system;

  const MyApp({super.key, required this.system});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ben Folio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue, brightness: Brightness.dark),
      ),
      home: MainPage(system: system),
    );
  }
}
