import 'package:multi/pages/counter.dart';
import 'package:multi/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:multi/pages/calc.dart';
import 'package:multi/pages/rock.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        '/count' :(context)=> Counter(),
        '/' :(context)=> House(),
        '/calc':(context)=> Calculator(),
        '/game 1': (context)=> Rock(),

      },
    );
  }
}
  
