// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'dart:math';

import 'package:cloudpromax/src/games/game_score.dart';
import 'package:flutter/material.dart';

import 'package:fluttericon/typicons_icons.dart';

class GameHome extends StatefulWidget {
  const GameHome({Key? key}) : super(key: key);

  @override
  _GameHomeState createState() => _GameHomeState();
}

class _GameHomeState extends State<GameHome> {
  TextEditingController answer = TextEditingController();
  dynamic randomNumber;
  int? lowerLimit;
  dynamic myColor;
  int? upperLimit;
  int questionsLeft = 4;
  int score = 0;
  dynamic image;
  dynamic text;
  List<Widget> grades = [];

  dynamic color;
  void checkGenerate() {
    // check user answer
    String userInput = answer.text;
    String randomNum = randomNumber.toString();

    if (userInput == randomNum) {
      grades.add(
        Grade(
          icon: Icons.check_rounded,
          randomNumber: randomNumber,
        ),
      );
      score = score + 1;
    } else {
      grades.add(
        Grade(
          icon: Typicons.cancel,
          randomNumber: randomNumber,
        ),
      );
    }

    //Generate new question(Random number, UL, LL)
    if (questionsLeft > 0) {
      randomNumber = 1 + Random().nextInt(99 - 1);
      lowerLimit = 1 + Random().nextInt(3 - 1);
      upperLimit = 1 + Random().nextInt(3 - 1);
    } else if (score == 0) {
      image = "assets/poor.jpg";
      text = "Don't Cry..!";
      myColor = Colors.blue[200];
      color = Colors.yellow;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ScoreHome(
                    score: score,
                    image: image,
                    text: text,
                    myColor: myColor,
                    color: color,
                  )),
          ModalRoute.withName("/"));
    } else if (score < 3) {
      image = "assets/james.jpg";
      text = "Try Next time..!";
      myColor = Colors.green;
      color = Colors.pink;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ScoreHome(
                    score: score,
                    image: image,
                    text: text,
                    myColor: myColor,
                    color: color,
                  )),
          ModalRoute.withName("/"));
    } else if (score < 5) {
      image = "assets/good.jpg";
      text = "Good..!";
      myColor = Colors.blueGrey;
      color = Colors.purple;

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ScoreHome(
                    score: score,
                    image: image,
                    text: text,
                    color: color,
                    myColor: myColor,
                  )),
          ModalRoute.withName("/"));
    } else {
      image = "assets/perfect_guys.jpg";
      text = "Atta Boi..!";
      color = Colors.deepOrange;
      myColor = Colors.lime[400];
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => ScoreHome(
                    score: score,
                    image: image,
                    text: text,
                    myColor: myColor,
                    color: color,
                  )),
          ModalRoute.withName("/"));
    }

    --questionsLeft;

    //printing on the terminal
    //print("this is the random number $randomNumber");

    answer.clear();
    setState(() {});
  }
  //  @override
  // void dispose() {
  //   answer.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();

    randomNumber = 10 + Random().nextInt(99 - 10);
    lowerLimit = 1 + Random().nextInt(3 - 1);
    upperLimit = 1 + Random().nextInt(3 - 1);

    //printing on the terminal
    //print("this is the random number $randomNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: grades),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  child: Text(
                    "The number is between ${randomNumber - lowerLimit} & ${randomNumber + upperLimit}",
                    style:
                        const TextStyle(fontSize: 30, color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  child: TextFormField(
                    controller: answer,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        hintText: "What is your number?",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 169, 181, 184),
                          fontSize: 18,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                color: Color(0xff0c6980), width: 2.5)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(
                                color: Color(0xff0c6980), width: 2.5)),
                        suffixIcon: InkWell(
                          onTap: () {
                            checkGenerate();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff0c6980),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class Grade extends StatelessWidget {
  final IconData icon;
  final int randomNumber;

  const Grade({
    Key? key,
    required this.icon,
    required this.randomNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 34,
          color: const Color.fromARGB(255, 63, 43, 44),
        ),
        Container(
          height: 7,
          width: 44,
          decoration: BoxDecoration(
              color: const Color(0xFF71D6D3),
              borderRadius: BorderRadius.circular(20)),
        ),
        Text(
          "$randomNumber",
          style: const TextStyle(
            fontSize: 26,
            color: Color(0xfff51720),
          ),
        )
      ],
    );
  }
}
