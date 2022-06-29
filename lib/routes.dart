import 'package:agency/controllers/work_controller.dart';
import 'package:agency/views/about_me.dart';
import 'package:agency/views/contact.dart';
import 'package:agency/views/home.dart';
import 'package:agency/views/single_work.dart';
import 'package:agency/views/work.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();

  static const aboutMe = '/about-me';
  static const contact = '/contact';
  static const home = '/home';
  static const singleWork = '/single-work';
  static const work = '/work';
}

class GetPages {
  GetPages._();

  static final list = [
    GetPage(
      name: Routes.aboutMe,
      page: () => const AboutMe(),
    ),
    GetPage(
      name: Routes.contact,
      page: () => Contact(),
    ),
    GetPage(
      name: Routes.home,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.singleWork,
      page: () => SingleWork(),
    ),
    GetPage(
        name: Routes.work,
        page: () => Work(),
        binding: BindingsBuilder(() {
          Get.put(WorkController());
        })),
  ];
}
