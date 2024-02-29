import 'package:flutter/material.dart';
import 'package:my_project/lesson%202/screenTwo.dart';

enum Gender { male, female }

class LessonTwo extends StatefulWidget {
  const LessonTwo({super.key});

  @override
  State<LessonTwo> createState() => _LessonTwoState();
}

class _LessonTwoState extends State<LessonTwo> {
  TextEditingController nameController = TextEditingController();
  Gender gender = Gender.female;
  int currentScreen = 0;
  List<Widget> screens = [
    const Center(
      child: Text("Home"),
    ),
    const Center(
      child: Text("Settings"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];

  String name = "";
  bool isChecked = false;
  String? magac;
  List<String> cities = ["Mogadishu", "Nairobi", "London"];
  String? city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lesson Two",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            // icon: const Icon(Icons.more_vert,color: Colors.white),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  print("PROFILE");
                },
                child: const Text("Profile"),
              ),
              PopupMenuItem(
                onTap: () {
                  print("SETTINGS");
                },
                child: const Text("Settings"),
              )
            ],
          )
        ],
      ),
      // body: screens[currentScreen],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameController,
              onChanged: (value) {
                // print(value);
                name = value;
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              // print(nameController.text);
              nameController.clear();
            },
            child: const Text("Click Me"),
          ),
          const SizedBox(
            height: 30,
          ),
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              print(value);
              isChecked = value!;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: gender,
              onChanged: (value) {
                gender = value ?? Gender.male;
                setState(() {});
              },
            ),
            title: const Text("Male"),
          ),
          ListTile(
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: gender,
              onChanged: (value) {
                gender = value ?? Gender.female;
                setState(() {});
              },
            ),
            title: const Text("Female"),
          ),
          const SizedBox(
            height: 30,
          ),
          DropdownButton(
            hint: const Text("Choose City"),
            value: city,
            items: cities.map((e) {
              return DropdownMenuItem(
                value: e.toLowerCase(),
                child: Text(e),
              );
            }).toList(),
            onChanged: (value) {
              // print(value);
              city = value;
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("This is dailoge"),
                      content: const Text("Are you sure to exit?"),
                      actions: [
                        TextButton(
                            onPressed: () {}, child: const Text("Cancel")),
                        TextButton(onPressed: () {}, child: const Text("Yes"))
                      ],
                    );
                  });
            },
            child: const Text("Show Dailoge"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "screenTwo");
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const ScreenTwo(),
              //   ),
              // );
            },
            child: const Text("Go Screen Two"),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        onTap: (index) {
          print(index);
          currentScreen = index;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
