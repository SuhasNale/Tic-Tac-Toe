import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: TicTacToe(),
    ));

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  String result = '';
  String message = '';
  bool playerOne = true;
  bool gamePlay = true;
  List<String> clickedData = ['', '', '', '', '', '', '', '', ''];
  int clickCounter = 0;

  void getPossibility(var index) {
    //CHECK IF ALL BOXES ARE TAPPED AND ITS DRAW
    if (clickCounter <= 9) {
      setState(() {
        //DISABLE THE DOUBLE TAP IF ALL BOXES ARE FILLED
        if (clickedData[index] == '') {
          clickCounter++;
          //GAMEPLAY IS TRUE THEN ASSIGN X OR O TO INDEXES MAKING PLAYE ONE TRUE AND FALSE ALTERNATIVELY
          if (gamePlay == true) {
            if (playerOne == true) {
              clickedData[index] = 'X';
              playerOne = false;
            } else {
              clickedData[index] = 'O';
              playerOne = true;
            }
            // CHECK ALL THE POSIBILITIES OF X AND ' '
            if (clickedData[0] == clickedData[1] &&
                clickedData[0] == clickedData[2] &&
                clickedData[0] != '') {
              result = 'Winner is';
            } else if (clickedData[1] == clickedData[4] &&
                clickedData[1] == clickedData[7] &&
                clickedData[1] != '') {
              result = 'Winner is';
            } else if (clickedData[0] == clickedData[3] &&
                clickedData[0] == clickedData[6] &&
                clickedData[0] != '') {
              result = 'Winner is';
            } else if (clickedData[2] == clickedData[5] &&
                clickedData[2] == clickedData[8] &&
                clickedData[2] != '') {
              result = 'Winner is';
            } else if (clickedData[3] == clickedData[4] &&
                clickedData[3] == clickedData[5] &&
                clickedData[3] != '') {
              result = 'Winner is';
            } else if (clickedData[6] == clickedData[7] &&
                clickedData[6] == clickedData[8] &&
                clickedData[6] != '') {
              result = 'Winner is';
            } else if (clickedData[0] == clickedData[4] &&
                clickedData[0] == clickedData[8] &&
                clickedData[0] != '') {
              result = 'Winner is';
            } else if (clickedData[6] == clickedData[4] &&
                clickedData[6] == clickedData[2] &&
                clickedData[6] != '') {
              result = 'Winner is';
            }
            print("result at index" + index.toString() + " is " + result);

            //RESULT IS NOT EMPTY THEN GAMEPLAY IS FALSE AND EITHER ONE IS WINNER
            if (result != '') {
              gamePlay = false;
              print("gameplay is" + gamePlay.toString());
              if (playerOne == true) {
                result = result + " Player Two";
              } else {
                result = result + " Player One";
              }
            }
            //COUNTER IS 9 AND THERE IS NO WINNER THEN DRAWN
            if ((clickCounter == 9) && gamePlay == true) {
              message = '';
              result = 'Game Drawn... No Winner!!';
            }
          } else {
            message = 'Game is Either Over or Drawn';
          }
        } else {}
      });
    } else {
      //IF ALL BOXES ARE FILLED AND GAMEPLAY IS TRUE AND STILL CONTINUES THEN DRAW
      if (gamePlay == true) {
        message = '';
        result = 'Game Drawn.. No Winner!!';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe',
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 25,
            )),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.amber[400],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ElevatedButton(
                              child: Text(
                                clickedData[0],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(0);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[1],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(1);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[2],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(2);
                              }),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.red,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              child: Text(
                                clickedData[3],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(3);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[4],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(4);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[5],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(5);
                              }),
                        ],
                      ),
                      const Divider(
                        height: 5,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                        color: Colors.red,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              child: Text(
                                clickedData[6],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(6);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[7],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(7);
                              }),
                          const VerticalDivider(
                            width: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.red,
                          ),
                          ElevatedButton(
                              child: Text(
                                clickedData[8],
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(20),
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.greenAccent,
                                elevation: 3,
                                minimumSize: Size(75, 20),
                              ),
                              onPressed: () {
                                getPossibility(8);
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          shadowColor: Colors.greenAccent,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          minimumSize: Size(10, 30),
                        ),
                        onPressed: () {
                          setState(() {
                            //RESET ALL THE PROPERTIES
                            clickedData = ['', '', '', '', '', '', '', '', ''];
                            result = '';
                            gamePlay = true;
                            playerOne = true;
                            message = '';
                            clickCounter = 0;
                          });
                        },
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 8,
                        // color: Colors.blueAccent[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(result),
                            Text(message),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
