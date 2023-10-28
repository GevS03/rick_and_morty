import 'package:flutter/material.dart';
import 'package:rick_and_morty_clean/features/persons/presentation/pages/persons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Persons(),
    );
  }
}