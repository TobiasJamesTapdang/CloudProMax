// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, avoid_unnecessary_containers

import 'package:cloudpromax/src/games/game_home.dart';
import 'package:flutter/material.dart';

class ScoreHome extends StatefulWidget {
  final int score;
  final String text;
  final String image;
  final Color myColor;

  final Color color;
  const ScoreHome({
    Key? key,
    required this.score,
    required this.text,
    required this.image,
    required this.myColor,
    required this.color,
  }) : super(key: key);

  @override
  _ScoreHomeState createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Container(
                  color: Colors.red[200],
                  height: 25.0,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 15),
                ),
                Container(
                  child: Text(
                    "CLOUDPRO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red[200],
                      fontWeight: FontWeight.w400,
                      fontSize: 40.0,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 40.0),
                ),
                Container(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(widget.image),
                  ),
                  margin: const EdgeInsets.only(bottom: 20.0),
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          widget.text,
                          style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff053f0c),
                          ),
                        ),
                        Text(
                          "${widget.score}/5",
                          style: TextStyle(
                              color: Colors.red[200],
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const GameHome()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: widget.myColor,
                          foregroundColor: widget.myColor),
                      child: const Text(
                        "CONTINUE PLAYING",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: widget.color,
                          foregroundColor: widget.color),
                      child:const Text(
                        "BACK TO HOME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
