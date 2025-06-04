import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  class House extends StatelessWidget {
    const House({super.key});

    @override
    Widget build(BuildContext context) {
      double scw = MediaQuery.sizeOf(context).width;
      final Color deepSpace = Color(0xEA121212);
      final Color buttonColor = Colors.white30;
      final Color textColor = Colors.white;
      final Color subTextColor = Colors.white70;

      return Scaffold(
        backgroundColor: deepSpace,
        appBar: AppBar(
          backgroundColor: Color(0x821FC0AE),
          foregroundColor: Colors.black,
          title: Text(
            "MultiApp",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.close_rounded, color: Colors.black),
            )
          ],
        ),
        body: SizedBox(
          width: scw,
          child:
            ListView(
              children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(left: 13,right: 13),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.90),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [BoxShadow(
                      color:Colors.cyan.shade200,
                      spreadRadius: 4,
                      blurRadius: 6,
                      offset: Offset(0,0)
                    ),],
                  ),
                  padding: EdgeInsets.all(25),
                  child: Center(
                    child: Text(
                          "This app has different features inbuilt in it. "
                          "It is designed to provide multiple applications all at once. "
                          "Users can perform different actions in one place.\n\n"
                          "For any feedback, feel free to share — your feedback is very valuable to us.\n"
                          "\n 1. This will lead to Counter App\n 2. This will lead to a Basic Calculator\n 3. This will lead to Rock Paper and Scissor Game",
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Poppins',
                        color: subTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 50),

                /// Counter App Button
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(child:
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/count');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor.withOpacity(0.15),
                              padding: EdgeInsets.all(20),
                              minimumSize: Size(50, 100),
                              shape: StadiumBorder()
                            ),
                            child: Text(
                              "Counter App",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                        ),
                        Expanded(child:
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/calc');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor.withOpacity(0.15),
                              padding: EdgeInsets.all(20),
                              minimumSize: Size(50, 100),
                              shape: StadiumBorder()
                            ),
                            child: Text(
                              "Basic Calculator",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                       )
                      ],
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/game 1');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white30.withOpacity(0.15),
                      padding: EdgeInsets.all(30),
                      minimumSize: Size(50, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),

                    ),
                    child: Text(
                      "Rock Paper Scissor Game",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],

            ),
        )
      );
    }
  }
