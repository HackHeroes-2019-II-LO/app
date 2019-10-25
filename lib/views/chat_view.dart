import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/widgets/chat_view_person.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => model.convos.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) => ChatViewPerson(
                  index: index,
                  convo: model.convos[index],
                ),
                itemCount: model.convos.length,
              )
            : Center(
                child: Text('Brak rozmów. Może warto byłoby kogoś poznać?'),
              ),
      );
}
