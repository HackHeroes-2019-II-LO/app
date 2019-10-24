import 'package:flutter/material.dart';
import 'package:hack_heroes/home_page.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/theme_data.dart';
import 'package:hack_heroes/types.dart';
import 'package:hack_heroes/views/conversation_view.dart';
import 'package:hack_heroes/views/settings_view.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModel<AppModel>(
        model: AppModel(),
        child: MaterialApp(
          title: 'Hack Heroes',
          theme: defaultTheme(context),
          initialRoute: AppRoutes.home,
          routes: {
            AppRoutes.home: (context) => HomePage(),
            AppRoutes.conversation: (context) => ConversationView(),
            AppRoutes.settings: (context) => SettingsView()
          },
        ),
      );
}
