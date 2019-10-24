import 'package:flutter/material.dart';
import 'package:hack_heroes/widgets/app_bar.dart';

class ConversationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ToDoAppBar(
        texts: ['Osoba 1'],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(),
    );
  }
}
