import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class questions_summary extends StatelessWidget {
  const questions_summary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          (data['userAnswer'] == data['correctAnswer'])
                              ? Colors.lightBlue.shade300
                              : const Color.fromARGB(255,249,133,241),
                      child: Center(
                        child: Text(
                          '${(data['questionIndex'] as int) + 1} .',
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data['question']}',
                              style: GoogleFonts.lato(color: Colors.white),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '${data['userAnswer']}',
                              style: GoogleFonts.lato(
                                  color: Color.fromARGB(255, 177, 129, 228)),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '${data['correctAnswer']}',
                              style: GoogleFonts.lato(
                                  color: Colors.lightBlue.shade400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
