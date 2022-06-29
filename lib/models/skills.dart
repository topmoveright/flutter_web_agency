import 'package:agency/constants/const_paths.dart';
import 'package:flutter/material.dart';

enum SkillType {
  admob,
  codeigniter,
  css3,
  dart,
  django,
  docker,
  electron,
  expressjs,
  firebase,
  flutter,
  git,
  html5,
  javascript,
  jquery,
  linux,
  mongodb,
  mysql,
  nginx,
  nodejs,
  php,
  postgresql,
  python,
  react,
  sqlite,
  strapi,
  mariadb,
}

class Skills {
  final List<SkillType> languageList;
  final List<SkillType> frontendList;
  final List<SkillType> backendList;
  final List<SkillType> dbList;

  final List<Image> imgListLanguage;
  final List<Image> imgListFrontend;
  final List<Image> imgListBackend;
  final List<Image> imgListDb;

  final List<Image> imgListGreyLanguage;
  final List<Image> imgListGreyFrontend;
  final List<Image> imgListGreyBackend;
  final List<Image> imgListGreyDb;

  Skills({
    required this.languageList,
    required this.frontendList,
    required this.backendList,
    required this.dbList,
  })  : imgListLanguage = _imgList(languageList),
        imgListGreyLanguage = _imgGreyList(languageList),
        imgListFrontend = _imgList(frontendList),
        imgListGreyFrontend = _imgGreyList(frontendList),
        imgListBackend = _imgList(backendList),
        imgListGreyBackend = _imgGreyList(backendList),
        imgListDb = _imgList(dbList),
        imgListGreyDb = _imgGreyList(dbList);

  static List<Image> _imgList(List<SkillType> skillTypeList) {
    if (skillTypeList.isEmpty) {
      return [];
    } else {
      return List.generate(
        skillTypeList.length,
        (index) => Image.asset(
            '${ConstPaths.logoImage}/${skillTypeList[index].name}.png'),
      );
    }
  }

  static List<Image> _imgGreyList(List<SkillType> skillTypeList) {
    if (skillTypeList.isEmpty) {
      return [];
    } else {
      return List.generate(
          skillTypeList.length,
          (index) => Image.asset(
              '${ConstPaths.logoImage}/grey/${skillTypeList[index].name}.png'));
    }
  }
}
