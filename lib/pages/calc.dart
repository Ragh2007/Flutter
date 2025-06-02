import 'package:flutter/material.dart';
class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}
int out = 0;
int a = 0 ;
int b = 0 ;
int add(){
  int out = a + b;
  return out;
}
class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context,'/');}, icon: Icon(Icons.arrow_back_rounded)),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(150),
            child: ElevatedButton(onPressed: (){a = 1;},
            child:Text("1"),),
            ),
            Container(
              margin: EdgeInsets.all(150),
              child: ElevatedButton(onPressed: (){a = 2;},
                child:Text("2"),),
            ),

          ],
        ),
      )

    );
  }
}
