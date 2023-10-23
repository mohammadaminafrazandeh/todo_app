import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/controllers/textfield_controller.dart';
import 'package:todo_app/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(KLightBlueColor, Brightness.light);
    return const Scaffold(
      backgroundColor: KLightBlueColor,
      floatingActionButton: FABNewTask(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            HeadWidget(),
            BottomWidget(),
          ],
        ),
      ),
    );
  }
}

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) {
              var task = Get.find<TaskController>()
                  .tasks[index]; //* desired task based on index
              return ListTile(
                title: Text(task.taskTitle ?? ''),
                subtitle: Text(task.taskSubtitle ?? ''),
                trailing: Checkbox(
                  value: task.status,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (value) {
                    task.status = !task.status!;
                    Get.find<TaskController>().tasks[index] = task;
                  },
                ),
                onTap: () {
                  Get.find<TaskController>().index = index;
                  Get.find<TaskController>().isEditing = true;
                  //
                  Get.find<TextfieldController>().taskTitle!.text =
                      task.taskTitle!;
                  //
                  Get.find<TextfieldController>().taskSubtitle!.text =
                      task.taskSubtitle!;
                  //
                  Get.toNamed('/addtaskscreen');
                },
                onLongPress: () {
                  Get.defaultDialog(
                      title: 'Warning',
                      // titleStyle: const TextStyle(fontSize: 10),
                      middleText: 'Are you sure for deleting the task?',
                      // middleTextStyle: const TextStyle(fontSize: 10),
                      backgroundColor: Colors.white,
                      radius: 15,
                      textCancel: 'No',
                      cancelTextColor: Colors.black,
                      onCancel: () {
                        Get.back();
                      },
                      textConfirm: 'Yes',
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Get.find<TaskController>().tasks.removeAt(index);
                        Get.back();
                      },
                      buttonColor: KLightBlueColor);
                },
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
                height: 3,
              );
            },
            itemCount: Get.find<TaskController>().tasks.length)),
      ),
    );
  }
}

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(
              horizontal: Get.width / 20, vertical: Get.height / 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height / 20, left: Get.width / 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.bookmarks,
                  color: KLightBlueColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, left: 10),
                child: const Text(
                  'All',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              GetBuilder<TaskController>(
                init: TaskController(),
                initState: (_) {},
                builder: (_) {
                  return Text(
                    '${Get.find<TaskController>().tasks.length} Tasks',
                    style: const TextStyle(color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FABNewTask extends StatelessWidget {
  const FABNewTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: KLightBlueColor,
      elevation: 0,
      heroTag: 'hero',
      onPressed: () {
        Get.find<TaskController>().isEditing = false;
        //
        Get.find<TextfieldController>().taskTitle!.text = '';
        Get.find<TextfieldController>().taskSubtitle!.text = '';
        //
        Get.toNamed('/addtaskscreen')!.then(
          (value) {
            MyApp.changeColor(KLightBlueColor, Brightness.light);
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
