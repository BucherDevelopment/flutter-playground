import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/screens/tabs.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.deepPurpleAccent,
        ),
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          secondary: Colors.deepPurpleAccent,
          // surface: Colors.white,
          // primaryContainer: Colors.white,
          // error: Colors.red,
          // onPrimary: Colors.white,
          // onSecondary: Colors.white,
          // onSurface: Colors.black,
          // onPrimaryContainer: Colors.black,
          // onError: Colors.white,
          // brightness: Brightness.light,
        ),
      ),

      home: TabsScreen(),
    );
  }
}
