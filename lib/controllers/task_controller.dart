import 'dart:ffi';

import 'package:get/get.dart';
import 'package:todo_app/models/task_model.dart';

class TaskController extends GetxController {
  bool isEditing = false;
  int index = 0;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
}
