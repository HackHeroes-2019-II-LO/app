import 'package:flutter/material.dart';
import 'package:hack_heroes/widgets/app_bar.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: ToDoAppBar(
          texts: ['Ustawienia'],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(),
      );
}
