import 'dart:async';

import 'package:flutter/material.dart';
import 'package:app_stage_buddy/question_list.dart';
import 'package:app_stage_buddy/add_new_question.dart';
import 'package:app_stage_buddy/survey.dart';
import 'package:app_stage_buddy/delete_question.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _questionList = [
    "Comment vous appelez-vous ?",
    "Comment allez vous?",
    "Quelle est votre couleur préférée ?"
  ];

  goToAddQuestionPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewQuestion(
          questionList: _questionList,
        ),
      ),
    ).then((value) => setState((() {})));
  }

  FutureOr goBackRefreshDeleteQuestion(dynamic value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questionnaire"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.menu_open, size: 40),
                    Text(
                      "Navigation",
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.view_list),
              title: const Text("Liste des questions"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuestionList(questionList: _questionList),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_circle),
              title: const Text("Ajouter une question"),
              onTap: goToAddQuestionPage,
            ),
            ListTile(
              leading: const Icon(Icons.delete_forever_rounded),
              title: const Text("Supprimer une question"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DeleteQuestion(
                      questionList: _questionList,
                    ),
                  ),
                ).then(goBackRefreshDeleteQuestion);
              },
            ),
          ],
        ),
      ),
      body: Survey(questionList: _questionList),
    );
  }
}
