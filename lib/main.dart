import 'package:dash_board/core/helper/on_generate_rout.dart';
import 'package:dash_board/core/services/get_it_service.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: OnGenerateRout.onGenerateRoute,
        initialRoute: OnGenerateRout.addProduct,
    );
  }
}

