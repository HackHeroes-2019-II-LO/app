import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/types.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(model.convos[index].partner),
            subtitle: Text(
              '${model.convos[index].messages.last.isOwned ? 'Ja' : model.convos[index].partner}: ${model.convos[index].messages.last.content}',
            ),
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.conversation,
              arguments: model.convos[index].partner,
            ),
          ),
          itemCount: model.convos.length,
        ),
      );
}
