import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gitbee/Screens/first_screen.dart';
import 'package:gitbee/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
            title: 'GitBee',
            theme: ThemeClass().lightThemeData(context),
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            home: FirstScreen());
      },
      designSize: Size(375, 812),
    );
  }
}
