import 'package:agency/constants/custom_size.dart';
import 'package:agency/models/work.dart';
import 'package:agency/routes.dart';
import 'package:agency/utils/functions.dart';
import 'package:agency/views/components/section.dart';
import 'package:agency/views/components/text_box_1.dart';
import 'package:agency/views/layouts/layout.dart';
import 'package:agency/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleWork extends GetResponsiveView {
  SingleWork({Key? key}) : super(key: key);

  @override
  Widget? builder() {
    final Work? work = Get.arguments;

    if (work == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Get.toNamed(Routes.work);
      });
    }
    var isDesktop = screen.screenType == ScreenType.Desktop;
    var crossAxisCount = isDesktop ? 3 : 2;

    return Layout(
      child: work == null
          ? const SizedBox.shrink()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Section(
                  backgroundImage: work.headImage,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: TextBox1(
                      title: work.title,
                      titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: CustomSize.defaultScreenWidth,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(CustomSize.xxx),
                          child: Builder(builder: (context) {
                            switch (screen.screenType) {
                              case ScreenType.Watch:
                              case ScreenType.Phone:
                              case ScreenType.Tablet:
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildContent(work),
                                    const SizedBox(height: CustomSize.xxx),
                                    buildSkills(work),
                                  ],
                                );
                              case ScreenType.Desktop:
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: buildContent(work),
                                    ),
                                    const SizedBox(width: CustomSize.xx),
                                    SizedBox(
                                      width: 300,
                                      child: buildSkills(work),
                                    ),
                                  ],
                                );
                            }
                          }),
                        ),
                        buildImageList(work, crossAxisCount: crossAxisCount),
                      ],
                    ),
                  ),
                ),
                /*PreNextButtonBar(
                  preOnPressed: () {},
                  menuOnPressed: () {},
                  nextOnPressed: () {},
                ),*/
              ],
            ),
    );
  }

  Widget buildImageList(Work work, {int crossAxisCount = 2}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: CustomSize.xxx,
        right: CustomSize.xxx,
        bottom: CustomSize.xxx,
      ),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        childAspectRatio: work.workType == WorkType.app ? 108 / 192 : 1,
        mainAxisSpacing: CustomSize.xx,
        crossAxisSpacing: CustomSize.xx,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          work.contentImageList.length,
          (index) => Widgets.mouseClickOnTap(
            onTap: () => Functions.imageShow(work.contentImageList, index),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: work.contentImageList[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSkills(Work work) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              'Skills',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
        const SizedBox(height: CustomSize.x),
        // Language
        buildSkillRow('Language', work.usedSkillList.imgListLanguage),
        buildSkillRow('Frontend', work.usedSkillList.imgListFrontend),
        buildSkillRow('Backend', work.usedSkillList.imgListBackend),
        buildSkillRow('DB', work.usedSkillList.imgListDb),

        /*Row(
          children: [
            SizedBox(
              width: CustomSize.xxx,
              child: Text('Client:',
                  style: Get.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ),
            Text(MockData.title, style: Get.textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: CustomSize.x),*/
      ],
    );
  }

  Widget buildContent(Work work) {
    return Text(
      work.content,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black38,
      ),
    );
  }

  Widget buildSkillRow(String title, List<Image> imageList) {
    return imageList.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(left: CustomSize.x),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: CustomSize.x),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 16,
                    children: imageList
                        .map((e) => SizedBox(
                              height: 50,
                              child: e,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          );
  }
}
