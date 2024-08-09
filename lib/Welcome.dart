import 'package:flutter/material.dart';
import 'Home.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String about = """You probably already know how to play Tic Tac Toe. It's a really simple game, right? That's what most people think. But if you really wrap your brain around it, you'll discover that Tic Tac Toe isn't quite as simple as you think!
Tic Tac Toe (along with a lot of other games) involves looking ahead and trying to figure out what the person playing against you might do next.""";

  String rules = """
1. The game is played on a grid that's 3 squares by 3 squares.
2. You are X , your friend (or the computer in this case) is O . Players take turns putting their marks in empty squares.
3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.
4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, bottom: 5),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text('WELCOME TO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const Text("TIC TAC TOE\nGAME",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Let\'s have fun playing....',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              InkWell(
                child: const Image(
                  image: AssetImage('images/1_About.png'),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Tic Tac Toe",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(about),
                            const SizedBox(height: 10),
                            const Text("Rules for Tic-Tac-Toe",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(rules),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 25,),
              InkWell(
                child: const Image(
                  image: AssetImage('images/2_Play.png'),
                ),
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                  ),
                  );
                },
              ),
              const SizedBox(height: 25,),
              //const Image(image: AssetImage('images/component3.png'),),
              //const SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    );
  }
}
