import 'package:flutter/material.dart';
import 'package:epicwarrior/app/modules/game1/quiz/q1.dart';
import 'package:epicwarrior/app/modules/game1/quiz/q2.dart';
import 'package:epicwarrior/app/modules/game1/quiz/q3.dart';
import 'package:epicwarrior/app/modules/game1/quiz/q4.dart';
import 'package:epicwarrior/app/modules/game1/quiz/q5.dart';
import 'package:epicwarrior/app/modules/game1/result.dart';
import 'package:epicwarrior/app/modules/game1/widget/button.dart';
import 'package:epicwarrior/app/modules/game1/widget/mario.dart';
import 'package:epicwarrior/app/modules/game1/widget/obsBlockEmp.dart';
import 'dart:async';

import 'package:get/get.dart';

class Game1View extends StatefulWidget {
  @override
  _Game1ViewState createState() => _Game1ViewState();
}

class _Game1ViewState extends State<Game1View> {
  int totalScore = 0;
  bool midrun = false;
  bool midjump = false;
  static bool mushroomEaten = false;
  static double marioX = 0;
  static double marioY = mushroomEaten ? 0.95 : 0.8;
  double mushroomX = 0.5;
  double mushroomY = 1;
  double time = 0;
  double height = 0;
  double gatotHeight = 0.8;
  double initialHeight = marioY;
  String direction = 'right';
  var gameFont = TextStyle(color: Colors.white, fontSize: 20);

  void resetGame() {
    setState(() {
      midrun = false;
      midjump = false;
      mushroomEaten = false;
      marioX = 0;
      marioY = mushroomEaten ? 0.95 : 0.8;
      mushroomX = 0.5;
      mushroomY = 1;
      time = 0;
      height = 0;
      initialHeight = marioY;
      direction = 'right';
    });
  }

  void checkIfAteMushroom() {
    if ((marioX - mushroomX).abs() < 0.05 &&
        (marioY - mushroomY).abs() < 0.05) {
      setState(() {
        mushroomEaten = true;
        //Move mushroom off the screen
        mushroomX = 2;
        if (marioY == 1) {
          marioY = 0.95;
        }
      });
    }
  }

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    // Disables double jump
    if (!midjump) {
      setState(() {
        midjump = true;
      });
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          setState(() {
            marioY = mushroomEaten ? 0.95 : 0.8;
            timer.cancel();
            midjump = false;
          });
        } else {
          setState(() {
            marioY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveRight() {
    direction = 'right';
    checkIfAteMushroom();

    Timer.periodic(Duration(milliseconds: 50), ((timer) {
      checkIfAteMushroom();

      if (MyButton().userIsHoldingButton() == true && marioX + 0.02 < 1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    }));
  }

  void moveLeft() {
    direction = 'left';
    checkIfAteMushroom();

    Timer.periodic(Duration(milliseconds: 50), ((timer) {
      checkIfAteMushroom();

      if (MyButton().userIsHoldingButton() == true && marioX - 0.02 > -1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    }));
  }

  void finishGame() {
    // Show a confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are You Sure?"),
          content: Text("Do you want to finish the game?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                // Close the dialog and navigate to the result screen
                Navigator.of(context).pop();
                goToResultScreen();
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void onPointEarned(int earnedPoints) {
    setState(() {
      totalScore += earnedPoints;
    });
  }

  void goToResultScreen() {
    int questionsAnswered =
        totalScore; // Total points correspond to questions answered

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          points: totalScore,
          questionsAnswered: questionsAnswered,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/app/assets/gameGatot/aldi.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            ObsBlockEmp(
                              x: 170.0,
                              y: 270.0,
                              onTap: () async {
                                Get.to(() => Quiz1Page(
                                      onPointEarned: (int earnedPoints) {
                                        onPointEarned(earnedPoints);
                                      },
                                    ));
                              },
                            ),
                            ObsBlockEmp(
                              x: 270.0,
                              y: 270.0,
                              onTap: () async {
                                Get.to(() => Quiz2Page(
                                      onPointEarned: (int earnedPoints) {
                                        onPointEarned(earnedPoints);
                                      },
                                    ));
                              },
                            ),
                            ObsBlockEmp(
                              x: 385.0,
                              y: 270.0,
                              onTap: () async {
                                Get.to(() => Quiz3Page(
                                      onPointEarned: (int earnedPoints) {
                                        onPointEarned(earnedPoints);
                                      },
                                    ));
                              },
                            ),
                            ObsBlockEmp(
                              x: 490,
                              y: 270.0,
                              onTap: () async {
                                Get.to(() => Quiz4Page(
                                      onPointEarned: (int earnedPoints) {
                                        onPointEarned(earnedPoints);
                                      },
                                    ));
                              },
                            ),
                            ObsBlockEmp(
                              x: 325,
                              y: 200,
                              onTap: () async {
                                Get.to(() => Quiz5Page(
                                      onPointEarned: (int earnedPoints) {
                                        onPointEarned(earnedPoints);
                                      },
                                    ));
                              },
                            ),
                            AnimatedContainer(
                              alignment: Alignment(marioX, marioY),
                              duration: Duration(milliseconds: 0),
                              child: MyMario(
                                direction: direction,
                                midrun: midrun,
                                midjump: midjump,
                                checkMarioType:
                                    mushroomEaten ? "SuperMario" : "Mario",
                                height: gatotHeight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "GATOT",
                            style: gameFont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "0000",
                            style: gameFont,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "WORLD",
                            style: gameFont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1-1",
                            style: gameFont,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "POINT",
                            style: gameFont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "$totalScore",
                            style: gameFont,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        function: moveLeft,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      MyButton(
                        function: jump,
                        child: Icon(
                          Icons.arrow_upward,
                          color: Colors.white,
                        ),
                      ),
                      MyButton(
                        function: moveRight,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MyButton(
                      function: resetGame,
                      child: Text(
                        "RESET",
                        style: gameFont,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MyButton(
                        function: finishGame,
                        child: Text(
                          "FINISH",
                          style: gameFont,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
