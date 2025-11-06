import 'package:dash_board/core/helper/on_generate_rout.dart';
import 'package:dash_board/core/services/get_it_service.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://uxqzxsmwmdcdmlpbbarc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV4cXp4c213bWRjZG1scGJiYXJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIxODc1ODUsImV4cCI6MjA3Nzc2MzU4NX0.JT3zvsSxFi_K3ycUhQ6P67LZo1xkvShTt6pKH8wmJX4',
  );
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
