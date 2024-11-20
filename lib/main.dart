import 'package:assignment1/screens/data_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Fetch Example',
      theme: ThemeData(
        primarySwatch: Colors.blue),
      home: DataScreens(),
    );
  }
}
