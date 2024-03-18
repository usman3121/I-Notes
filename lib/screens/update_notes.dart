import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GetxController/notes_controller.dart';

class UpdateNotes extends StatefulWidget {
  final String title;
  final String notesText;
  final String docId;

  const UpdateNotes({
    super.key,
    required this.title,
    required this.notesText,
    required this.docId,
  });

  @override
  State<UpdateNotes> createState() => _UpdateNotesState();
}

class _UpdateNotesState extends State<UpdateNotes> {
  final NotesController controller = Get.put(NotesController());
  String message = '';

  @override
  void initState() {
    controller.title.text = widget.title;
    controller.notesText.text = widget.notesText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'Update Notes',
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
          ),
        ),
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
          controller.updateNote(
            widget.docId,
            controller.title.text.toString(),
            controller.notesText.text.toString(),
          );
          Get.back();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
