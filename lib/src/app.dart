import 'package:flutter/material.dart';
import 'package:health/src/auth_wrapper.dart';
import 'package:health/src/pages/select_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AuthWrapper(
      child: const SelectPage(),
    );
  }
}