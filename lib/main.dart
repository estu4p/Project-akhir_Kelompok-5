import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:projekakhir_teori/models/favorite_model.dart';
import 'package:projekakhir_teori/screens/login.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<FavoriteModel>(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>('favoritesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PROJEK AKHIR',
      theme: ThemeData(
        primaryColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
