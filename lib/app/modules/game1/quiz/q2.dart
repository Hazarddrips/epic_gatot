import 'package:flutter/material.dart';

class Quiz2Page extends StatefulWidget {
  final Function(int) onPointEarned;

  Quiz2Page({required this.onPointEarned});

  @override
  _Quiz2PageState createState() => _Quiz2PageState();
}

class _Quiz2PageState extends State<Quiz2Page> {
  int score = 0;
  int wrongAttempts = 0;
  bool gameOver = false;
  bool answeredCorrectly = false;

  // Add a flag to track whether the quiz has been answered
  bool quizAnswered = false;

  void checkAnswer(int choice) {
    if (gameOver || quizAnswered) {
      // Do nothing if the game is over or the quiz has already been answered
      return;
    }

    if (choice == 1) {
      // Correct answer
      setState(() {
        score++;
        widget.onPointEarned(score);
        answeredCorrectly = true;
        quizAnswered = true; // Set the flag to true after answering the quiz
      });
    } else {
      // Incorrect answer
      setState(() {
        wrongAttempts++;

        if (wrongAttempts == 1) {
          // First wrong attempt
          answeredCorrectly = false;
        } else if (wrongAttempts == 2) {
          // Second wrong attempt
          answeredCorrectly = false;
          quizAnswered =
              true; // Set the flag to true after the second wrong attempt
          gameOver = true; // Game over after the second wrong attempt
        }
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OrientationBuilder(
          builder: (context, orientation) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: orientation == Orientation.portrait
                  ? buildPortraitLayout()
                  : SingleChildScrollView(
                      child: buildLandscapeLayout(),
                    ),
            );
          },
        ),
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildQuizSection(),
        // Conditionally display the image and fun fact
        if (quizAnswered) buildImageAndFunFactSection(),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: buildQuizSection(),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Conditionally display the image and fun fact
              if (quizAnswered) buildImageAndFunFactSection(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildQuizSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Who is Indonesia\'s first President?',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => checkAnswer(1),
          child: Text('Soekarno'),
        ),
        ElevatedButton(
          onPressed: () => checkAnswer(2),
          child: Text('Soeharto'),
        ),
        ElevatedButton(
          onPressed: () => checkAnswer(3),
          child: Text('Elon Musk'),
        ),
        SizedBox(height: 20),
        if (answeredCorrectly)
          Text(
            'Correct!',
            style: TextStyle(fontSize: 18, color: Colors.green),
          ),
        if (!answeredCorrectly && wrongAttempts == 1)
          Text(
            'Incorrect, try again',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
        if (gameOver)
          Column(
            children: [
              Text(
                'You Wrong! The Correct Answer is Soekarno',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(height: 10),
            ],
          ),
        // Display the score
        Text(
          'Score: $score',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back
          },
          child: Text('Go Back'),
        ),
      ],
    );
  }

  Widget buildImageAndFunFactSection() {
    // Use the asset path for the image
    String assetPath = 'lib/app/assets/quiz/soekarno.jpg';
    String funFact = 'Soekarno is the first president ';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetPath,
          width: 100, // Adjust the width as needed
          height: 100, // Adjust the height as needed
        ),
        SizedBox(height: 10),
        Text(
          funFact,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
