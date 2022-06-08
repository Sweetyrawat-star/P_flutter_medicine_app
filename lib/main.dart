import 'package:flutter/material.dart';
import 'package:medicine/HomePage.dart';
import 'package:medicine/theme.dart';
import 'package:provider/provider.dart';


void main() => runApp(MainPage());
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_)=> ThemeChanger(ThemeData.dark()),
      child: MyApp(),
    );
  }
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: HomeScreen(),
    );
  }
}

