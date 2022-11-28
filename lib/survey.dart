import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_stage_buddy/result_page.dart';

class Survey extends StatefulWidget {
  const Survey({super.key, required this.questionList});

  final List<String> questionList;

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  int _questionIndex = 0;
  String _userResponse = "";
  List<String> _responseList = List<String>.empty();

  getUserResponse(text) {
    setState(() {
      _userResponse = text;
    });
  }

  addItemInList() {
    List<String> tmp = _responseList;
    if (tmp.isEmpty == true) {
      tmp = List<String>.from(<String>[_userResponse]);
    } else {
      tmp.add(_userResponse);
    }
    setState(() {
      _userResponse = "";
      _responseList = tmp;
    });
  }

  saveUserAnswer() {
    addItemInList();
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  FutureOr onGoBack(dynamic value) {
    _responseList = List<String>.empty();
    setState(() {});
  }

  saveFinalUserAnswer() {
    addItemInList();
    setState(() {
      _questionIndex = 0;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(responseList: _responseList),
      ),
    ).then(onGoBack);
  }

  renderText() {
    if (_questionIndex >= widget.questionList.length - 1) {
      return (ElevatedButton(
        onPressed: saveFinalUserAnswer,
        child: const Text("Terminé"),
      ));
    } else {
      return (ElevatedButton(
        onPressed: saveUserAnswer,
        child: const Text("Suivant"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.questionList[_questionIndex]),
        TextField(
          onChanged: getUserResponse,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Entrez vos informations ici'),
        ),
        renderText()
      ],
    );
  }
}
