import 'package:agency/constants/custom_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Functions {
  Functions._();

  static void imageShow(List<Image> imageList, int selectedIndex) {
    var currentIndex = selectedIndex;
    Get.dialog(
      Material(
        color: Colors.transparent,
        child: StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(CustomSize.xx),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${currentIndex + 1}/${imageList.length}',
                          style: Get.textTheme.bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(Icons.close),
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        imageList[currentIndex],
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      currentIndex = (currentIndex == 0
                                              ? imageList.length
                                              : currentIndex) -
                                          1;
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.black38,
                            child: IconButton(
                              onPressed: () {
                                setState(
                                  () {
                                    currentIndex =
                                        (currentIndex + 1) % imageList.length;
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
