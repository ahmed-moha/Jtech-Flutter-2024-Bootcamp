import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

import '../lesson 6/services.dart';
import 'data_model.dart';

class LessonSix extends StatefulWidget {
  const LessonSix({super.key});

  @override
  State<LessonSix> createState() => _LessonSixState();
}

class _LessonSixState extends State<LessonSix> with AfterLayoutMixin {
  List<DataModel> data = [];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Six"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Builder(builder: (cont) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (data.isEmpty) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(data[index].title),
                    leading: Text(data[index].id.toString()),
                  ),
                );
              }
            }),
          )
        ],
      ),
    );
  }

  getPosts() async {
    try {
      isLoading = true;
      setState(() {});

      data = await Services().getPosts();
      setState(() {});
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    getPosts();
  }
}
