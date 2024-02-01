import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answerText,required this.onpressed,});
  final String answerText;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255,33,1,95),
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40  ,vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
      ),
          onPressed: onpressed,
          child: Text(answerText, textAlign: TextAlign.center,),
        );
  }
}