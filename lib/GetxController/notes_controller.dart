import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/Utils/utils.dart';

class NotesController extends GetxController {
  RxList<Note> notes = <Note>[].obs;

  final TextEditingController title = TextEditingController();
  final TextEditingController notesText = TextEditingController();

  //final ref = FirebaseFirestore.instance.collection("Notes");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  String? getCurrentUserID() {
    return _auth.currentUser?.uid;
  }

  CollectionReference userNotesCollection() {
    return _firestore
        .collection('users')
        .doc(getCurrentUserID())
        .collection('notes');
  }

  Future<void> addNote() async {
    try {
      await userNotesCollection().add({
        'title': title.text,
        'notes': notesText.text,
      });
      title.clear();
      notesText.clear();
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }

  Future<void> updateNote(String docID, String newTitle, String newNote) async {
    try {
      await userNotesCollection().doc(docID).update({
        'title': newTitle,
        'notes': newNote,
      });
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }

  Future<void> deleteNote(String docID) async {
    try {
      await userNotesCollection().doc(docID).delete();
    } catch (e) {
      Utils().toastMessage(e.toString());
    }
  }
}

class Note {
  String title;
  String notes;

  Note({required this.title, required this.notes});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['notes'] = notes;
    return data;
  }
}
