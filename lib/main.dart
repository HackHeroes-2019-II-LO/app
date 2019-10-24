import 'package:flutter/material.dart';
import 'package:hack_heroes/home_page.dart';
import 'package:hack_heroes/theme_data.dart';
import 'package:hack_heroes/views/conversation_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hack Heroes',
      theme: defaultTheme(context),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/conversation': (context) => ConversationView(),
      },
    );
  }
}
