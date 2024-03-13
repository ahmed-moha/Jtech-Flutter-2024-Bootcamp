import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_project/lesson%207/my_provider.dart';
import 'package:provider/provider.dart';

class LessonSeven extends StatefulWidget {
  const LessonSeven({super.key});

  @override
  State<LessonSeven> createState() => _LessonSevenState();
}

class _LessonSevenState extends State<LessonSeven> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    print("HELLOW");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Seven"),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         context.watch<MyProvider>().count.toString(),
      //         style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //       ),
      //       const SizedBox(
      //         height: 30,
      //       ),
      //       ElevatedButton(
      //           onPressed: () => context.read<MyProvider>().increament(),
      //           child: const Text("Click"))
      //     ],
      //   ),
      // ),

      body: Consumer<MyProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.users.isEmpty) {
            return const Center(
              child: Text("No Data found"),
            );
          } else {
            return ListView.builder(
              itemCount: provider.users.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Are you sure to delete?"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("No")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Provider.of<MyProvider>(context, listen: false)
                                  .deleteUser(provider.users[index]);
                            },
                            child: const Text("Yes"))
                      ],
                    ),
                  );
                },
                leading: Text(provider.users[index].id.toString()),
                title: Text(provider.users[index].name ?? ""),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    Provider.of<MyProvider>(context, listen: false).loadUsers();
  }
}
