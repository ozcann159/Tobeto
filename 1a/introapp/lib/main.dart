import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: QuestionsScreen()));
}

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz-logo.png"),
            const Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text('Start'),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(12)),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  String question = "Soru 1";
  List<String> answers = [
    "Liste Elemanı 1",
    "Cevap2",
    "Cevap3",
    "Cevap4",
    "Cevap 5"
  ];

  void changeQuestion() {
    setState(() {
      question = "Soru 2";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(question),
            ...answers.map((answer) {
              return ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ));
            }),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Cevap 1",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
