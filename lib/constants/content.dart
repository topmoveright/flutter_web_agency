import 'package:agency/constants/const_paths.dart';
import 'package:agency/models/skills.dart';
import 'package:agency/models/work.dart';

class Content {
  Content._();

  static const mailAddress = 'test@test.com';
  static const gitHubUrl = 'https://github.com/test';

  // about me
  static const aboutMeText1 = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Vivamus ac leo vitae mi fringilla gravida non at purus.
Mauris quis urna at urna eleifend scelerisque nec in purus.
Morbi finibus sapien in nunc euismod pulvinar.
''';

  static const aboutMeText2 =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Vivamus ac leo vitae mi fringilla gravida non at purus.
Mauris quis urna at urna eleifend scelerisque nec in purus.
  ''';

  static final List<Work> workList = [
    ...List.generate(
      10,
      (index) => Work(
        workType: WorkType.app,
        title: 'work',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        headImagePath: '${ConstPaths.workImage}/item/head.png',
        contentImagePathList: [
          '${ConstPaths.workImage}/item/content.png',
          '${ConstPaths.workImage}/item/content.png',
          '${ConstPaths.workImage}/item/content.png',
          '${ConstPaths.workImage}/item/content.png',
        ],
        usedSkillList: Skills(
          languageList: [SkillType.dart],
          frontendList: [SkillType.flutter],
          backendList: [SkillType.expressjs],
          dbList: [SkillType.mongodb],
        ),
      ),
    ),
  ];
}
