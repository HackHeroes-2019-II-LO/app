import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/widgets/app_bar.dart';
import 'package:hack_heroes/widgets/chat_bubble.dart';
import 'package:scoped_model/scoped_model.dart';

class ConversationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String partner = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ToDoAppBar(
        texts: [partner],
        center: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          final convo = model.convoWith(partner);
          return ListView.builder(
            itemBuilder: (context, index) =>
                /* ListTile(
              title: Text(convo.messages[index].isOwned ? 'Ja' : partner),
              subtitle: Text(convo.messages[index].content),
            ),*/
                ChatBubble(
              message: convo.messages[index],
            ),
            itemCount: convo.messages.length,
          );
        },
      ),
    );
  }
}
