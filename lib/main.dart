import 'package:flutter/material.dart';
import 'package:ticket_master_clone/views/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue).copyWith(
                secondary: Colors.blue.shade200,
                primary: const Color(0xff026BDE),
                surface: const Color(0xffF5F5F5)),
            primaryColor: const Color(0xff026BDE),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
