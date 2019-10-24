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
      body: Column(
        children: <Widget>[
          Flexible(
            child: ScopedModelDescendant<AppModel>(
              builder: (context, child, model) {
                final convo = model.convoWith(partner);
                return ListView.builder(
                  itemBuilder: (context, index) => ChatBubble(
                    message: convo.messages[index],
                  ),
                  itemCount: convo.messages.length,
                );
              },
            ),
          ),
          Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      hintText: 'Aa',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).textTheme.display1.color,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () => null,
              )
            ],
          )
        ],
      ),
    );
  }
}
