import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/controllers/textfield_controller.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(const Color(0xfff5f5f5), Brightness.dark);
    return const Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            TitleWidget(),
            TaskTextField(),
            NoteWidget(),
            MyButton(),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: Get.width,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          if (Get.find<TaskController>().isEditing) {
            //*Editing
            var task = Get.find<TaskController>()
                .tasks[Get.find<TaskController>().index];
            //
            task.taskTitle = Get.find<TextfieldController>().taskTitle!.text;
            task.taskSubtitle =
                Get.find<TextfieldController>().taskSubtitle!.text;
            //
            Get.find<TaskController>().tasks[Get.find<TaskController>().index] =
                task;
          } else {
            //*Adding
            Get.find<TaskController>().tasks.add(
                  TaskModel(
                    taskTitle: Get.find<TextfieldController>().taskTitle!.text,
                    taskSubtitle:
                        Get.find<TextfieldController>().taskSubtitle!.text,
                    status: false,
                  ),
                );
          }
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: KLightBlueColor,
        ),
        child: Text(Get.find<TaskController>().isEditing ? 'Edit' : 'Add'),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextField(
        controller: Get.find<TextfieldController>().taskSubtitle,
        maxLength: 30,
        cursorColor: KLightBlueColor,
        decoration: InputDecoration(
          hintText: 'Add note',
          prefixIcon: const Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          counter: Container(),
        ),
      ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<TextfieldController>().taskTitle,
        maxLines: 6,
        cursorColor: KLightBlueColor,
        cursorHeight: 40,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: Text(
        'What are you planning?',
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 45.0),
              child: Text(
                Get.find<TaskController>().isEditing ? 'Edit Task' : 'New Task',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              )),
        ),
        Hero(
          tag: 'hero',
          child: Material(
            color: const Color(0xfff5f5f5),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close),
            ),
          ),
        )
      ],
    );
  }
}
