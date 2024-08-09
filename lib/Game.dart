import 'package:flutter/material.dart';
import 'Home.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String about = """You probably already know how to play Tic Tac Toe. It's a really simple game, right? That's what most people think. But if you really wrap your brain around it, you'll discover that Tic Tac Toe isn't quite as simple as you think!
Tic Tac Toe (along with a lot of other games) involves looking ahead and trying to figure out what the person playing against you might do next.""";

  String rules = """
1. The game is played on a grid that's 3 squares by 3 squares.
2. You are X , your friend (or the computer in this case) is O . Players take turns putting their marks in empty squares.
3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.
4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.""";

  bool xTurn = true;
  List<String> displayElement = List.filled(9, '');
  int xScore = 0;
  int oScore = 0;
  int filledBoxes = 0;
  //String turn = 'X';

  @override
  Widget build(BuildContext context) {
    final String text = ModalRoute.of(context)!.settings.arguments as String;
    final List<String> text1 = text.split(" ");
    final String name1 = text1[0];
    final String name2 = text1[1];
    return Scaffold(
      //backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('Tic Tac Toe',
          style: TextStyle(fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildScoreColumn('Player X: $name1', xScore),
                SizedBox(width: 20),
                _buildScoreColumn('Player O: $name2', oScore),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              height: 350,
              width: 350,
              color: Colors.lightBlueAccent[200],
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _handleTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.white,
                            width: 2),
                      ),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: 30,),
            //dispTurn(xTurn);
            Text(dispTurn(xTurn),
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                alignment: Alignment.bottomLeft,
                minimumSize: const Size(100, 30),
                elevation: 35,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
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
              child: const Text('About',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
            //const Text("Player {$turn} turn"),
            /*Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                onPressed: _clearScoreBoard,
                child: Text("Clear Score Board"),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildScoreColumn(String player, int score) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          player,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          score.toString(),
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }

  void _handleTap(int index) {
    if (displayElement[index] == '') {
      setState(() {
        displayElement[index] = xTurn ? 'X' : 'O';
        filledBoxes++;
        if (_checkWinner()) {
          _showWinDialog(xTurn ? 'X' : 'O');
        }
        else if (filledBoxes == 9) {
          _showDrawDialog();
        }
        xTurn = !xTurn;
      });
    }
  }

  bool _checkWinner() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (displayElement[i] == displayElement[i + 1] &&
          displayElement[i] == displayElement[i + 2] &&
          displayElement[i] != '') {
        return true;
      }
    }
    // Check columns
    for (int i = 0; i < 3; i++) {
      if (displayElement[i] == displayElement[i + 3] &&
          displayElement[i] == displayElement[i + 6] &&
          displayElement[i] != '') {
        return true;
      }
    }
    // Check diagonals
    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      return true;
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      return true;
    }
    return false;
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Player $winner wins!'),
          actions: [
            TextButton(
              child: Icon(
                Icons.home_rounded,
                color: Colors.blueAccent,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: Icon(
                Icons.repeat_rounded,
                color: Colors.blueAccent,
                size: 30,
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("It's a draw!",),
          actions: [
            TextButton(
              child: Icon(
                Icons.home_rounded,
                color: Colors.blueAccent,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
            ),
            TextButton(
              child: Icon(
                Icons.repeat_rounded,
                color: Colors.blueAccent,
                size: 30,
              ),
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      displayElement = List.filled(9, '');
      filledBoxes = 0;

    });
  }

  String dispTurn(bool turn){
    if (turn == true){
      return 'Player X turn';
    }
    else {
      return 'Player O turn';
    }
  }

  /*void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      _clearBoard();
    });
  }*/
}
