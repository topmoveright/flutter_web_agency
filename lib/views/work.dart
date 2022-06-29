import 'package:agency/controllers/work_controller.dart';
import 'package:agency/models/work.dart';
import 'package:agency/routes.dart';
import 'package:agency/views/components/category_menu.dart';
import 'package:agency/views/components/work_square.dart';
import 'package:agency/views/layouts/layout.dart';
import 'package:agency/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Work extends GetResponsiveView {
  Work({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    late int columns;
    switch (screen.screenType) {
      case ScreenType.Watch:
      case ScreenType.Phone:
        columns = 1;
        break;
      case ScreenType.Tablet:
        columns = 2;
        break;
      case ScreenType.Desktop:
        columns = 4;
        break;
    }

    return Layout(
      child: GetBuilder<WorkController>(
        builder: (ctl) {
          return Column(
            children: [
              CategoryMenu(
                selectedIndex: ctl.selectedWorkType == null
                    ? 0
                    : WorkType.values.indexOf(ctl.selectedWorkType!) + 1,
                list: [
                  TextButton(
                    onPressed: () => ctl.selectWorkType(null),
                    child: const Text('ALL'),
                  ),
                  ...List.generate(
                    WorkType.values.length,
                    (index) => TextButton(
                      onPressed: () =>
                          ctl.selectWorkType(WorkType.values[index]),
                      child: Text(WorkType.values[index].name.toUpperCase()),
                    ),
                  )
                ],
              ),
              GridView.count(
                crossAxisCount: columns,
                childAspectRatio: 1,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(), // GridView 모바일 드래그 대응
                children: List.generate(
                  ctl.workList.length,
                  (index) => Widgets.mouseClickOnTap(
                    onTap: () => Get.toNamed(
                      Routes.singleWork,
                      arguments: ctl.workList[index],
                    ),
                    child: WorkSquare(
                      title: ctl.workList[index].title,
                      subTitle: ctl.workList[index].workType.name.toUpperCase(),
                      imageProvider: ctl.workList[index].headImage.image,
                      hoverColor: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
