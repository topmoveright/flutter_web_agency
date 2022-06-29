import 'package:agency/models/skills.dart';
import 'package:flutter/material.dart';

enum WorkType {
  app,
  web,
  window,
  design,
}

class Work {
  final WorkType workType;
  final Image headImage;
  final String title;
  final String content;
  final Skills usedSkillList;
  final List<Image> contentImageList;

  Work({
    required this.workType,
    required String headImagePath,
    required this.title,
    required this.content,
    required List<String> contentImagePathList,
    required this.usedSkillList,
  })  : headImage = Image.asset(headImagePath),
        contentImageList =
            contentImagePathList.map((e) => Image.asset(e)).toList();
}
