import 'package:flutter/material.dart';
import 'Welcome.dart';
//import 'Game.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController _player1Ctrl = TextEditingController();
  final TextEditingController _player2Ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                    child: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              //const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.only(right: 30, left: 25),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text('Have a great time playing',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Image(
                  image: AssetImage('images/airbollon.png'),
                ),
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _player1Ctrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Player 1',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 400,
                child: TextField(
                  controller: _player2Ctrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Player 2',
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              const Padding(
                padding: EdgeInsets.only(right: 30, bottom: 10),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'All the best',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[500],
                  minimumSize: const Size(200, 50),
                  elevation: 35,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/game',
                    arguments: _player1Ctrl.text + " " + _player2Ctrl.text,
                  );
                },
                child: const Text('Start Game',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
