import 'package:flutter/material.dart';

class LessonThree extends StatefulWidget {
  const LessonThree({super.key});

  @override
  State<LessonThree> createState() => _LessonThreeState();
}

class _LessonThreeState extends State<LessonThree> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lesson Three",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: size.height/3,
            color: Colors.orange,
          )
          // Padding(
          //   padding: const EdgeInsets.all(30),
          //   child: Container(
          //     width: 200,
          //     height: 200,
          //     decoration:  const BoxDecoration(
          //       color: Colors.white,
          //       // border: Border(top: BorderSide(),bottom: BorderSide()),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20)
          //       ),
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.black12,
          //           blurRadius: 20,

          //         )
          //       ]
          //     ),
          //   ),
          // )

          // Expanded(
          //   flex:10 ,
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Column(
          //           children: [
          //             Expanded(
          //               child: Container(
          //                 color: Colors.orange,
          //               ),
          //             ),
          //              Expanded(
          //               child: Container(
          //                 color: Colors.black,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           color: Colors.brown,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Expanded(
          //   flex: 4,
          //   child: Container(
          //     color: Colors.blue,
          //   ),
          // )
        ],
      ),
    );
  }
}
