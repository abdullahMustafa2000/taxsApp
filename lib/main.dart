import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:texs_app/api/api_service.dart';
import 'package:texs_app/ui/home_page.dart';

void main() {
  GetIt.I.registerLazySingleton(()=> ApiService());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}