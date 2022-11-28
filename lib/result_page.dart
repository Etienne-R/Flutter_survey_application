import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.responseList});

  final List<String> responseList;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result Page")),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            return (Text(widget.responseList[index]));
          }),
          separatorBuilder: ((context, index) {
            return (const Divider(
              color: Colors.black,
            ));
          }),
          itemCount: widget.responseList.length),
    );
  }
}
