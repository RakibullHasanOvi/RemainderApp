import 'package:daly_task_app/models/task_model.dart';
import 'package:daly_task_app/providers/colorselet_provider.dart';
import 'package:daly_task_app/providers/dropdown_prodiver.dart';
import 'package:daly_task_app/providers/pickerdate_provider.dart';
import 'package:daly_task_app/providers/pickertime_provider.dart';
import 'package:daly_task_app/providers/repeat_provider.dart';
import 'package:daly_task_app/providers/task_provider.dart';
import 'package:daly_task_app/providers/themeprovider.dart';
import 'package:daly_task_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/boxes.dart';

void main() async {
// Uses hive database..
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  boxTasks = await Hive.openBox<Task>('TaskBox');
  WidgetsFlutterBinding.ensureInitialized();
// This is useing for to stop oriantion mood..
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
//! there has used lots of provider...
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => DateProvider()),
        ChangeNotifierProvider(create: (context) => TimeChangeProvider()),
        ChangeNotifierProvider(create: (context) => RemainderProvider()),
        ChangeNotifierProvider(create: (context) => RepeatProvider()),
        ChangeNotifierProvider(create: (context) => SeletedClrProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return ScreenUtilInit(
            builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Daily Task Manager',
              theme: ThemeData(
                useMaterial3: true,
              ),
              // themeMode: ThemeMode.dark,
              //  themeProvider.getTheme(),
              home: const HomeScreen(),
            ),
            designSize: const Size(340, 640),
            minTextAdapt: true,
            splitScreenMode: true,
          );
        },
      ),
    );
  }
}
