import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medication/model/todo_model.dart';

class TodoService {
  final todoCollection =
      FirebaseFirestore.instance.collection('systolicPressure');

  //CRUD

  //CREATE
  void addNewTask(TodoModel model) {
    todoCollection.add(model.toMap());
  }
}
