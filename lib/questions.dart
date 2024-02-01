import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questiondata.dart';

class Questions extends StatefulWidget {
  const Questions({super.key,required this.selectectedAnswer});
  final void Function(String) selectectedAnswer;
  @override
  State<Questions> createState() {
    return QuestionsState();
  }
}

class QuestionsState extends State<Questions> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.selectectedAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;  
      
    });
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                style: GoogleFonts.lato(color: const Color.fromARGB(255,237,223,252),fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ...currentQuestion.getShuffleAnswers().map(
                (answer) {
                  return AnswerButton(
                    answerText: answer,
                    onpressed: () => answerQuestion(answer),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
