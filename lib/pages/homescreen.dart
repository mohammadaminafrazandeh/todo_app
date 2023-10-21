import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constant.dart';
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
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text('Title'),
                subtitle: const Text('Subtitle'),
                trailing: Checkbox(
                  value: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onChanged: (value) {},
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
                height: 3,
              );
            },
            itemCount: 5),
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
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const Text(
                  'Tasks',
                  style: TextStyle(color: Colors.white),
                ),
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
