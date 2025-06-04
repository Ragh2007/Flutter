import 'package:flutter/material.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class Rock extends StatefulWidget {
  const Rock({super.key});

  @override
  State<Rock> createState() => _RockState();
}

class _RockState extends State<Rock> {
  String ip = "";
  String result = "";
  String text = "";
  bool outscr = false;
  bool out = false;

  String choose() {
    List l1 = ["Rock", "Paper", "Scissor"];
    final random = Random();
    return l1[random.nextInt(l1.length)];
  }

  String play(String ip1) {
    ip = ip1;
    result = choose();
    if (ip == result) {
      text = "It's a Draw!";
    } else if ((ip == "Rock" && result == "Scissor") ||
        (ip == "Paper" && result == "Rock") ||
        (ip == "Scissor" && result == "Paper")) {
      text = "You Win!";
    } else {
      text = "You Lose!";
    }

    setState(() {
      outscr = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        outscr = false;
        ip = "";
        result = "";
        text = "";
      });
    });

    leader();

    return text;
  }

  int user = 0;
  int pc = 0;

  void leader() {
    if (text == "You Win!") {
      setState(() {
        user++;
      });
    } else if (text == "It's a Draw!") {
      setState(() {});
    } else {
      setState(() {
        pc++;
      });
    }
  }

  Future<void> _launchYouTube() async {
    final Uri url = Uri.parse('https://www.youtube.com/watch?v=dKGjGlIYlcw');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void menu() {
    setState(() {
      out = !out;
    });
  }

  @override
  Widget build(BuildContext context) {
    double scw = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: ElevatedButton(
          onPressed: () {
            Navigator.pop(context, '/');
          },
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          child: Icon(Icons.arrow_left, color: Colors.white70),
        ),
        title: Text(
          "Rock, Paper & Scissor",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          IconButton(onPressed: () {
            menu();
          }, icon: Icon(Icons.menu_rounded, size: 15,))
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: scw * 0.95 > 600 ? 600 : scw * 0.95,
          child: Stack(
            children: [
              Center(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: [
                    Text(
                      "Welcome to this simple yet fun game.\nThis game brings back the childhood memories of playing Rock 🪨, Paper 📰 and Scissor ✂️.\nHope you like it! Don't forget to give feedback.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.white30),
                    ),
                    SizedBox(height: 50),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child:
                        TextButton(
                          onPressed: () {
                            play("Rock");
                          },
                          style: TextButton.styleFrom(
                              shape: CircleBorder(),
                              backgroundColor: Colors.transparent),
                          child: Text("✊", style: TextStyle(fontSize: 50)),
                        ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child:
                        TextButton(
                          onPressed: () {
                            play("Paper");
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: Text("🖐️", style: TextStyle(fontSize: 50)),
                        ),
                        ),
                        SizedBox(width: 20),
                        Expanded(child:
                        TextButton(
                          onPressed: () {
                            play("Scissor");
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent),
                          child: Text("✌️", style: TextStyle(fontSize: 50)),
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Column(
                      children: [
                        Text(
                          "Leader Board",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orangeAccent.withOpacity(0.5),
                                blurRadius: 100,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "User",
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    user.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text(
                                    "PC",
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    pc.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          result,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ip = "";
                          result = "";
                          text = "";
                          user = 0;
                          pc = 0;
                        });
                      },
                      child: Text("Reset"),
                    ),
                  ],
                ),
              ),

              if (outscr)
                Container(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("You Chose",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white70,
                                fontSize: 16)),
                        Text(ip,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                                fontSize: 18)),
                        SizedBox(height: 10),
                        Text("and PC chose",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white70,
                                fontSize: 16)),
                        Text(result,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                                fontSize: 18)),
                        Text(
                          text,
                          style: TextStyle(
                            color: Colors.lightGreenAccent,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (out)
                Container(
                  margin: EdgeInsets.only(left: 70),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 30,
                            offset: Offset(0, 0))
                      ],
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(30)),
                  height: 314,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 100),
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.transparent),
                          child: Text(
                            "Home",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      Container(
                        height: 7,
                        color: Colors.black,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/count');
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              minimumSize: Size(double.infinity, 100),
                              backgroundColor: Colors.transparent),
                          child: Text(
                            "Counter",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          )),
                      Container(
                        height: 7,
                        color: Colors.black,
                      ),
                      TextButton(
                          onPressed: () {
                            _launchYouTube();
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 100),
                              backgroundColor: Colors.transparent),
                          child: Text(
                            "To be Added",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
