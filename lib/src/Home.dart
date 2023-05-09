// ignore_for_file: file_names

import 'package:cloudpromax/src/games/game_home.dart';
import 'package:cloudpromax/src/status/status_home.dart';
import 'package:flutter/material.dart';

import 'notes/notes_home.dart';
import 'todo/todo_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 30, left: 13, right: 13),
      color: Colors.blue[100],
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Good morning,Tobias..",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/tobias.jpg"),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Categories',
            style: TextStyle(
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(3.0, 2.0),
                    blurRadius: 2.0,
                    color: Color(0xFFDF9696),
                  ),
                ],
                fontSize: 28,
                color: Color(0xFFFAB7C3),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
             onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const TodoHome()));
      },
            child: const Panel(
                image: "assets/todo.png",
                title: "Todo",
                titleColor: Color(0xffbdeae2)),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const NotesPage()));
      },
            child: const Panel(
                image: "assets/notes.png",
                title: "Notes",
                titleColor: Color(0xff79f0d0)),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
           onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyAppI()));
      },
            child: const Panel(
                image: "assets/status-male.png",
                title: "Status",
                titleColor: Color(0xffcd6477)),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const GameHome()));
      },
            child: const Panel(
                image: "assets/games.png",
                title: "Games",
                titleColor: Color(0xff7a9ed2)),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}

class Panel extends StatelessWidget {
  final String image;
  final String title;
  final Color titleColor;

  const Panel({super.key, required this.title, required this.image, required this.titleColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container( 
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image,
                    ),
                    fit: BoxFit.cover),
                color: Colors.purple,
                borderRadius: BorderRadius.circular(7)),
            height: 190,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              title,
              style: TextStyle(shadows: const <Shadow>[
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color(0xffaa0000),
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color.fromARGB(125, 0, 0, 200),
                ),
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                  color: Color(0xff79f0d0),
                ),
              ], 
              fontSize: 30, color: titleColor, fontWeight: FontWeight.w600),
            ),
          )
        ],
    );
  }
}
