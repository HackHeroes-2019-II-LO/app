import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/widgets/discover_person.dart';
import 'package:scoped_model/scoped_model.dart';

class DiscoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<AppModel>(
        builder: (context, child, model) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DiscoverPerson(person: model.discoverList[0]),
            DiscoverPerson(person: model.discoverList[1]),
            DiscoverPerson(person: model.discoverList[2]),
          ],
        ),
      );
}
