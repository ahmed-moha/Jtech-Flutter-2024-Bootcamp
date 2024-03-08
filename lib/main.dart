import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:my_project/lesson%202/lessontwo.dart';
import 'package:my_project/lesson%203/lessonThree.dart';
import 'package:my_project/lesson%204/lesson_four.dart';
import 'package:my_project/lesson%205/lesson_five.dart';

import 'lesson 2/screenTwo.dart';

void main() {
  runApp(
    MaterialApp(
      // home: Home(),
      // home: HomeTwo(),
      // home: const LessonThree(),
      home:const LessonFive(),
      routes: {
        "home": (context) => const Home(),
        "screenTwo": (context) => const ScreenTwo()
      },
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.white),
          title: const Text(
            "My AppBar",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Colors.blue,
          actions: const [
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            Icon(
              Icons.share,
              color: Colors.white,
            )
          ],
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //  Row(
            //   children: [
            //      Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.cyan,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.red,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.black,
            //   ),
            //   ],
            //  ),
            //    Row(
            //   children: [
            //      Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.yellow,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.pink,
            //   ),
            //   Container(
            //     width: 100,
            //     height: 100,
            //     color: Colors.black,
            //   ),
            //   ],
            //  )
            // buttons example

            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text("Elevated Button"),
            // ),
            // TextButton(onPressed: () {}, child: const Text("TextButton")),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.person)),

            // IMAGES DISPLAYING
            // const Image(
            //   image: NetworkImage(
            //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj9UJe5LuuGUKtCpQBRwSC9fmyZhFNOe2xiQ&usqp=CAU"),
            // ),
            // Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj9UJe5LuuGUKtCpQBRwSC9fmyZhFNOe2xiQ&usqp=CAU")

            // Image.asset("images/1.jpeg")
          ],
        ));
  }
}

class HomeTwo extends StatefulWidget {
  const HomeTwo({super.key});

  @override
  State<HomeTwo> createState() => _HomeTwoState();
}

class _HomeTwoState extends State<HomeTwo> {
  int count = 0;
  double size = 24;

  @override
  Widget build(BuildContext context) {
    print("BUILD CALLED");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Statefull Widget",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Icon(
            Icons.person,
            size: size,
          ),
          const SizedBox(
            height: 80,
          ),
          Text(size.toStringAsFixed(0)),
          Slider(
            max: 100,
            min: 0,
            value: size,
            // divisions: 100,
            onChanged: (value) {
              size = value;
              setState(() {});
            },
          ),
          Text(
            "$count",
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("Increament"))
        ],
      ),
    );
  }
}
