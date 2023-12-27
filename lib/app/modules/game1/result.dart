import 'package:epicwarrior/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final int points;
  final int questionsAnswered; // Add this line

  ResultPage(
      {required this.points, required this.questionsAnswered}); // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              points >= 1 ? 'YOU PASSED' : 'YOU FAILED',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your Points: $points',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Questions Answered: $questionsAnswered',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Get.to(HomeView());
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
