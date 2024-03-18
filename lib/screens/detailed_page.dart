import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String notes;

  const DetailScreen({super.key, required this.title, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Detail Screen',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $title',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Text(
              'Notes: $notes',
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
