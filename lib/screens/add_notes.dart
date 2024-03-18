import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/GetxController/notes_controller.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({
    super.key,
  });

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final NotesController controller = Get.put(NotesController());
  String message = '';

  final fireStore = FirebaseFirestore.instance.collection("Notes");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Add New Notes',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.title,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.notesText,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Your Notes Here',
              ),
            ),
          ),
          Text(message),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          controller.addNote();
          Get.back();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
