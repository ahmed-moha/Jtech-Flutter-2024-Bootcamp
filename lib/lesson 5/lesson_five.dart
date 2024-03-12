import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_project/lesson%205/image_model.dart';
import 'package:my_project/lesson%205/services.dart';

class LessonFive extends StatefulWidget {
  const LessonFive({super.key});

  @override
  State<LessonFive> createState() => _LessonFiveState();
}

class _LessonFiveState extends State<LessonFive> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  List<ImageModel> data = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson five"),
      ),
      body: Form(
        key: form,
        child: Column(children: [
          Expanded(child: Builder(builder: (context) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.isEmpty) {
              return const Center(child: Text("No Data found"));
            } else {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Image.network(
                    data[index].imageUrl ?? "",
                    fit: BoxFit.cover,
                  );
                },
                itemCount: data.length,
              );
            }
          })),

          // ElevatedButton(
          //   onPressed: ()async {
          //     print("Ahmed 1");
          //    await  Future.delayed(const Duration(seconds: 2), () {
          //       print("Maryam 2");
          //     });
          //     print("Faarah 3");
          //   },
          //   child: const Text("Click Me"),
          // )
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: TextFormField(
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "name is required";
          //       }
          //       return null;
          //     },
          //     controller: name,
          //     decoration: const InputDecoration(
          //         hintText: "Name", border: OutlineInputBorder()),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: TextFormField(
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "email is required";
          //       }
          //       return null;
          //     },
          //     controller: email,
          //     decoration: const InputDecoration(
          //         hintText: "E-mail", border: OutlineInputBorder()),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: TextFormField(
          //     validator: (value) {
          //       if (value == null || value.isEmpty) {
          //         return "address is required";
          //       }
          //       return null;
          //     },
          //     controller: address,
          //     decoration: const InputDecoration(
          //         hintText: "Address", border: OutlineInputBorder()),
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: ElevatedButton(
          //       onPressed: () {
          //         if (form.currentState?.validate() ?? false) {
          //           print("SUCCCESS");
          //         }
          //       },
          //       child: const Text("Submit")),
          // )
        ]),
      ),
    );
  }

  getImages() async {
    try {
      isLoading = true;
      setState(() {});
      await Future.delayed(const Duration(seconds: 5));
      data = await Services().getData();
      setState(() {});
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
      setState(() {});
    }
  }
}
