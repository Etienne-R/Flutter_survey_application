import 'package:flutter/material.dart';

class DeleteQuestion extends StatefulWidget {
  DeleteQuestion({super.key, required this.questionList});

  List<String> questionList;

  @override
  State<DeleteQuestion> createState() => _DeleteQuestionState();
}

class _DeleteQuestionState extends State<DeleteQuestion> {
  deleteSelectedQuestion(indexItemToDelete) {
    List<String> tmp = widget.questionList;
    if (tmp.length > 1) {
      tmp.removeAt(indexItemToDelete);
      setState(() {
        widget.questionList = tmp;
      });
    }
  }

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
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (Text(
                widget.questionList[index],
                style: const TextStyle(fontSize: 20),
              )),
              IconButton(
                  onPressed: () {
                    deleteSelectedQuestion(index);
                  },
                  icon: const Icon(Icons.delete))
            ],
          );
        },
      ),
    );
  }
}
