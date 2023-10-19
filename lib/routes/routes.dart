import 'package:get/get.dart';
import 'package:todo_app/pages/homescreen.dart';

class Routes {
  static List<GetPage> get pages => [
    GetPage(name: '/homescreen', page: () => const HomeScreen(),)
  ];
}
