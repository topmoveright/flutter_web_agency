import 'package:agency/constants/content.dart';
import 'package:agency/models/work.dart';
import 'package:get/get.dart';

class WorkController extends GetxController {
  WorkType? selectedWorkType;

  List<Work> get workList {
    if (selectedWorkType == null) {
      return Content.workList;
    } else {
      return Content.workList
          .where((e) => e.workType == selectedWorkType)
          .toList();
    }
  }

  void selectWorkType(WorkType? workType){
    selectedWorkType = workType;
    update();
  }
}
