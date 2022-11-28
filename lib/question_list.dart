import 'package:flutter/material.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({super.key, required this.questionList});

  final List<String> questionList;

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Liste des questions")),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return (const Divider(
            color: Colors.black,
          ));
        },
        itemCount: widget.questionList.length,
        itemBuilder: (context, index) {
          return (Text(
            widget.questionList[index],
            style: const TextStyle(fontSize: 20),
          ));
        },
      ),
    );
  }
}
