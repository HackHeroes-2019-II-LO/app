import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/widgets/app_bar.dart';
import 'package:scoped_model/scoped_model.dart';

class ConversationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String partner = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ToDoAppBar(
        texts: [partner],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(model.convoWith(partner).messages[index].isOwned ? 'Ja' : partner),
            subtitle: Text(model.convoWith(partner).messages[index].content),
          ),
          itemCount: model.convoWith(partner).messages.length,
        ),
      ),
    );
  }
}
