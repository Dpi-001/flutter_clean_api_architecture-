import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/service_locator.dart';
import 'package:flutter_application_3/features/home/presentation/screens/home_screen.dart';

void main() {
  serviceLocator();
  // Initialize the service locator
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
