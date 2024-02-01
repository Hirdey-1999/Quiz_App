import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questiondata.dart';
import 'package:quiz_app/questions_summary.dart';

class resultsscreen extends StatelessWidget {
  const resultsscreen ({super.key,required this.chosenAnswers,required this.onpressed});
  final List<String> chosenAnswers;
  final void Function() onpressed;
  List<Map<String, Object>> get getSummaryData {
    final List<Map<String,Object>> summary  = [];
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correctAnswer': questions[i].answers[0],
        'userAnswer': chosenAnswers[i],
      });
    }
    return summary;
  }
  @override
  Widget build(BuildContext context){
    final summaryData = getSummaryData;
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['correctAnswer'] == data['userAnswer'];
    },).length;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('You Answered $correctAnswers out of $totalQuestions questions correctly!',style: GoogleFonts.lato(color: Colors.white,fontSize: 18),textAlign: TextAlign.center,),
            SizedBox(height: 30.0,),
            questions_summary(summaryData: getSummaryData,),
            SizedBox(height: 30.0,),
            TextButton.icon(onPressed: onpressed, icon: Icon(Icons.refresh,color: Colors.white,) ,label: Text('Restart Quiz',style: TextStyle(color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}