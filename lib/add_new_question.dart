import 'package:flutter/material.dart';

class AddNewQuestion extends StatefulWidget {
  AddNewQuestion({super.key, required this.questionList});

  List<String> questionList;

  @override
  State<AddNewQuestion> createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  String _questionEntered = "";

  getUserResponse(text) {
    setState(() {
      _questionEntered = text;
    });
  }

  saveQuestion(context) {
    List<String> tmp = widget.questionList;
    tmp.add(_questionEntered);
    setState(() {
      widget.questionList = tmp;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une question"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: getUserResponse,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Entrez vos informations ici'),
          ),
          ElevatedButton(
              onPressed: () {
                saveQuestion(context);
              },
              child: const Text("Valider")),
        ],
      ),
    );
  }
}
