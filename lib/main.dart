import 'package:clock_app/enum.dart';
import 'package:clock_app/models/menu_info.dart';
import 'package:clock_app/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'avenir',
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock, 'rgr', 'rg'),
          child: HomePage()),
    );
  }
}
