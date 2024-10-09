import 'package:final_exam_flutter/view/likedpage/add_to_like.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/getx_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    var controller = Get.put(HomeController());
    final headingController = TextEditingController();
    final noteController = TextEditingController();
    final editHeadingController = TextEditingController();
    final editNoteController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Notes',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(LikedPage());
            },
            child: Icon(
              CupertinoIcons.ellipsis_vertical_circle,
              size: 30,
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 5),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search Your Notes',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.noteList.length,
                itemBuilder: (context, index) {
                  final items = controller.noteList[index];

                  return Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ListTile(
                      title: Text(items.heading ?? ''),
                      subtitle: Text(items.notes ?? ''),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Edit the item
                                editHeadingController.text =
                                    items.heading ?? '';
                                editNoteController.text = items.notes ?? '';
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Edit notes'),
                                      content: Column(
                                        children: [
                                          TextField(
                                            controller: editHeadingController,
                                            decoration: const InputDecoration(
                                                hintText: 'Enter new heading'),
                                          ),
                                          TextField(
                                            controller: editNoteController,
                                            decoration: const InputDecoration(
                                                hintText: 'Enter new note'),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            if (editHeadingController
                                                    .text.isNotEmpty &&
                                                editNoteController
                                                    .text.isNotEmpty) {
                                              items.heading =
                                                  editHeadingController.text;
                                              items.notes =
                                                  editNoteController.text;

                                              Get.find<HomeController>()
                                                  .updateItem(items);
                                              Get.back();
                                            }
                                          },
                                          child: const Text('Save'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(CupertinoIcons.pen),
                            ),
                            IconButton(
                              onPressed: () {
                                // Delete the item
                                controller.deleteItem(items.id!);
                              },
                              icon: const Icon(Icons.delete_outline),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.addFavItem(items.heading!, items.notes!);
                                Get.to(LikedPage());
                              },
                              icon: const Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.grey.shade100,
              actions: [
                TextField(
                  controller: headingController,
                  decoration: InputDecoration(labelText: 'Heading'),
                ),
                TextField(
                  controller: noteController,
                  decoration: InputDecoration(labelText: 'note'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 135,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.addItem(headingController.text ?? '',
                              noteController.text ?? '');
                          headingController.clear();
                          noteController.clear();
                          Get.back();
                        },
                        child: Text('Save')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('Back')),
                  ],
                )
              ],
            ),
          );
        },
        backgroundColor: Colors.black,
        shape: CircleBorder(side: BorderSide(width: 2, color: Colors.grey)),
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
