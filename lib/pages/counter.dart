import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  bool out = false;
  void increment(){
    setState(() {
      counter++;
    });
  }
  void reset(){
    setState(() {
      counter = 0 ;
      out = true;
    });
    Future.delayed(Duration(seconds: 2,milliseconds: 5),(){
      setState(() {
        out = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context,'/');}, icon: Icon(Icons.arrow_back_rounded)),
      ),
      body:Stack(
        children: [
          Center(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [SizedBox(height: 150,),
                Text("This counter below shows the number of times button is clicked ",style: TextStyle(fontSize: 20,color: Colors.black,fontStyle: FontStyle.italic,fontFamily: 'Poppins',fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                Text(counter.toString(),
                  style: TextStyle(fontSize: 30,color: Colors.black),textAlign:TextAlign.center,),
                Builder(
                  builder: (context) => ElevatedButton(onPressed: increment,style: ElevatedButton.styleFrom(
                    fixedSize: Size.fromHeight(100),backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                  ), child: Text("Hit me",style: TextStyle(fontSize: 25),),
                  )
                ),
                Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ]
                ),
                child: ElevatedButton(onPressed: reset, child: Text(""
                    "Reset")
                ),)
              ],
            ),
          ),
          if(out)
            Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child:
                      Text("Wait Will we reload the Page for you",
                        style:TextStyle(
                            color: Colors.cyan,
                          fontSize: 40,
                        ) ,
                      textAlign: TextAlign.center,),
                  ),
                  CircularProgressIndicator(color: Colors.white70,),],
              ),
            ),

        ],
      )
    );
  }
}
