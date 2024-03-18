import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate_practice/GetxController/notes_controller.dart';
import '../routes/app_routes.dart';
import 'detailed_page.dart';
import 'update_notes.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final NotesController controller = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
     final userNotesCollection =
         FirebaseFirestore.instance.collection("users").doc(controller.getCurrentUserID()).collection('notes');

    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Your Notes',
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
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
                Get.offNamed(App_Routes.initial);
              });
            },
            icon: const Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.black)),
        child: StreamBuilder<QuerySnapshot>(
           stream: userNotesCollection.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return const Text("There is some error in building snapshot");
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200, // Set your desired maximum width
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailScreen(
                      title: data['title'].toString(),
                      notes: data['notes'].toString(),
                    ));

                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Edit icon
                                  IconButton(
                                    onPressed: () {
                                      Get.to(UpdateNotes(
                                        title: data['title'],
                                        notesText: data['notes'],
                                        docId: snapshot.data!.docs[index].id,
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      size: 17,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.deleteNote(snapshot.data!.docs[index].id);
                                    },
                                    icon: const Icon(Icons.delete_forever, size: 17),
                                  ),
                                ],
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: ListTile(
                                  title: Text(data['title'].toString(),overflow: TextOverflow.ellipsis,),
                                  subtitle: Text(data['notes'].toString(),overflow: TextOverflow.ellipsis,),
                                  isThreeLine: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        onPressed: () {
          // Navigate to add notes page
          Get.toNamed(App_Routes.addNotes);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

