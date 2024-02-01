import 'package:flutter/material.dart';
import 'package:quiz_app/data/questiondata.dart';
import 'package:quiz_app/landingScreen.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});
  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
  var activeScreen = 'landingScreen';
  List<String> selectedAnswers = [];
  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void restartScreen() {
    setState(() {
      activeScreen = 'landingScreen';
    });
  }

  void selectedAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = landingScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = Questions(
        selectectedAnswer: selectedAnswer,
      );
    }
    if (activeScreen == 'landingScreen') {
      screenWidget = landingScreen(switchScreen);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = resultsscreen(chosenAnswers: selectedAnswers,onpressed: restartScreen,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple,
        primaryTextTheme: const TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: screenWidget,
    );
  }
}
