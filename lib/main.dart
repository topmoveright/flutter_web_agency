import 'package:agency/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 폰트 라이센스 추가
  LicenseRegistry.addLicense(() async* {
    final license =
        await rootBundle.loadString('assets/fonts/Noto_Sans_KR/OFL.txt');
    yield LicenseEntryWithLineBreaks(['Noto_Sans_KR'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: GetPages.list,
      theme: ThemeData(fontFamily: 'NotoSansKR'),
      defaultTransition: Transition.cupertino,
    );
  }
}


