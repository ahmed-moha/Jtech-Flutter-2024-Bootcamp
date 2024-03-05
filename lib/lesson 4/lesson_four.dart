import 'package:flutter/material.dart';

class LessonFour extends StatelessWidget {
  const LessonFour({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isPorait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(title: const Text("Lesson Four")),
      body: Column(
        children: [
          Container(
            width: isPorait ? size.width / 2 : size.height / 2,
            height: isPorait ? size.height / 3 : size.width / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          "images/1.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              Icon(Icons.date_range),
                              Text("2022-may-09")
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Best ISP of the years",
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bluekom somalia best internet provider",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

          //     Container(
          //       width: 200,
          //       height: 350,
          //       color: Colors.orange,
          //       child: Stack(
          //         children: [
          //           Column(
          //             children: [
          //               Expanded(
          //                 child: Image.asset(
          //                   "images/1.jpeg",
          //                   fit: BoxFit.cover,
          //                 ),
          //               )
          //             ],
          //           ),
          //           const Positioned(
          //             bottom: 10,
          //             right: 10,
          //             child: Text(
          //               "Hellow World",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //           const Positioned(
          //             top: 10,
          //             right: 10,
          //             child: Icon(
          //               Icons.person,
          //               size: 45,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ],
          //       ),
          //     )
        ],
      ),
    );
  }
}
