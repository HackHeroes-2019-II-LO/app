import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';
import 'package:scoped_model/scoped_model.dart';

final rng = new Random();

class AppModel extends Model {
  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  final List<Person> _people = List<int>.generate(1000, (i) => i)
      .map(
        (i) => Person(
          id: i,
          name: [
            'Andrzej',
            'Zbychu',
            'Karolina',
            'Kamil',
            'Jarosław',
            'Ania',
            'Agnieszka',
            'Helga',
            'Hans',
            'Hammond',
            'Karol'
          ][rng.nextInt(11)],
          country: [
            'Polska',
            'Niemcy',
            'Ukraina',
            'Rosja',
            'UK',
            'Francja',
            'USA',
            'Holandia'
          ][rng.nextInt(8)],
          age: 15 + rng.nextInt(30),
        ),
      )
      .toList();

  final List<int> _discoverList = [
    rng.nextInt(1000),
    rng.nextInt(1000),
    rng.nextInt(1000),
  ];

  final List<Conversation> _convos = [];

  UnmodifiableListView<Conversation> get convos =>
      UnmodifiableListView<Conversation>(_convos);

  Conversation convoWith(Person partner) =>
      _convos.firstWhere((conv) => conv.partner.id == partner.id);

  void addMessage(Person partner, String content) {
    _convos.firstWhere((conv) => conv.partner.id == partner.id).messages.add(
          Message(
            content: content,
            isOwned: true,
          ),
        );

    _convos.firstWhere((conv) => conv.partner.id == partner.id).lastTimestamp =
        DateTime.now();

    notifyListeners();
  }

  UnmodifiableListView<Person> get discoverList =>
      UnmodifiableListView<Person>(_discoverList.map((i) => _people[i]));

  void addFriend(int id) {
    _convos.add(Conversation(
      partner: _people.firstWhere((person) => person.id == id),
      messages: [Message(content: 'Cześć!', isOwned: true)],
      lastTimestamp: DateTime.now(),
    ));

    var newId = rng.nextInt(_people.length);
    while (convos.any((convo) => convo.partner.id == newId) ||
        _discoverList.any((i) => i == newId)) {
      newId = rng.nextInt(_people.length);
    }
    _discoverList[_discoverList.indexWhere((i) => i == id)] = newId;
  }
}
