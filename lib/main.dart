import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mosque_location/presentation/ui/MosqueListScreen.dart';

import 'core/getit/setupGetIt.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MosqueListPage(), // Use MosqueListPage here
    );
  }
}