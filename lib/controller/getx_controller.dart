import 'package:final_exam_flutter/helper/db_helper.dart';
import 'package:final_exam_flutter/model/notesmodel.dart';
import 'package:get/get.dart';




class HomeController extends GetxController {
  RxList<Notesmodel> noteList = <Notesmodel>[].obs;
  RxList<Notesmodel> favList = <Notesmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      noteList.value = await DBHelper.dbHelper.getItem();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  Future<void> addFavItem(String heading, String notes) async {
    if (heading.isNotEmpty && notes.isNotEmpty) {
      Notesmodel notesmodel = Notesmodel(heading: heading, notes: notes);
      await DBHelper.dbHelper.insertData(notesmodel);
    } else {
      print("Name or Description is empty");
    }
  }

  Future<void> addItem(String heading, String notes) async {
    if (heading.isNotEmpty && notes.isNotEmpty) {
      Notesmodel notesmodel = Notesmodel(heading: heading, notes: notes);
      await DBHelper.dbHelper.addFavourite(notesmodel);
      await fetchData();
    } else {
      print("Name or Description is empty");
    }
  }
  Future<void> updateItem(Notesmodel item) async {
    try {
      await DBHelper.dbHelper.updateData(item);
      await fetchData();
    } catch (e) {
      print("Error updating item: $e");
    }
  }

  Future<void> deleteItem(int id) async {
    try {
      await DBHelper.dbHelper.deleteData(id);
      await fetchData();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }
}

