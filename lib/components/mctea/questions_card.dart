import 'package:flutter/material.dart';

class ShowQuestions extends StatelessWidget {
  const ShowQuestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFA7D5FF),
            Color(0xFFEAF6FE),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: const [
          QuestionsWithAnswer(
            question: "How long does the webinar will be conducted ?",
            answer: "It will take around half an hour ",
            isAnswered: true,
          ),
          QuestionsWithAnswer(
            question: "How long does the webinar will be conducted ?",
            answer: "It will take around half an hour ",
            isAnswered: false,
          ),
          QuestionsWithAnswer(
            question: "How long does the webinar will be conducted ?",
            answer: "It will take around half an hour ",
            isAnswered: true,
          ),
        ],
      ),
    );
  }
}

class QuestionsWithAnswer extends StatefulWidget {
  final String question;
  final String? answer;
  final bool isAnswered;

  const QuestionsWithAnswer({
    Key? key,
    required this.question,
    required this.isAnswered,
    this.answer,
  }) : super(key: key);

  @override
  State<QuestionsWithAnswer> createState() => _QuestionsWithAnswerState();
}

class _QuestionsWithAnswerState extends State<QuestionsWithAnswer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 10, right: 10, bottom: 5),
              child: Row(
                children: [
                  const Text(
                    "Q : ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.question,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            if (widget.isAnswered)
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    const Text(
                      "A : ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.answer!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (!widget.isAnswered)
              const Padding(
                padding:
                    EdgeInsets.only(bottom: 15, left: 10, right: 10, top: 5),
                child: Text(
                  "Reply",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
