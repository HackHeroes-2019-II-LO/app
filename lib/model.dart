import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';
import 'package:scoped_model/scoped_model.dart';

final rng = new Random();

class AppModel extends Model {
  static AppModel of(BuildContext context) => ScopedModel.of<AppModel>(context);

  final List<Person> _people = List<int>.generate(100, (i) => i)
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
    rng.nextInt(100),
    rng.nextInt(100),
    rng.nextInt(100),
  ];

  final List<Conversation> _convos = [
    Conversation(
      partner: 'Osoba 1',
      messages: [
        Message(
          isOwned: true,
          content: 'Cześć!',
        ),
        Message(
          isOwned: false,
          content: 'Hej',
        ),
        Message(
          isOwned: false,
          content: 'Bardzo długa wiadomość wysłana na potrzeby testu.',
        )
      ],
      lastTimestamp: DateTime.now().subtract(Duration(hours: 5)),
    ),
    Conversation(
      partner: 'Osoba 2',
      messages: [
        Message(
          isOwned: false,
          content: 'Siemka!',
        ),
        Message(
          isOwned: true,
          content: 'Cześć! Co u ciebie?',
        ),
      ],
      lastTimestamp: DateTime.now().subtract(Duration(days: 2)),
    )
  ];

  UnmodifiableListView<Conversation> get convos =>
      UnmodifiableListView<Conversation>(_convos);

  Conversation convoWith(String partner) =>
      _convos.firstWhere((conv) => conv.partner == partner);

  void addMessage(String partner, String content) {
    _convos.firstWhere((conv) => conv.partner == partner).messages.add(
          Message(
            content: content,
            isOwned: true,
          ),
        );

    _convos.firstWhere((conv) => conv.partner == partner).lastTimestamp =
        DateTime.now();

    notifyListeners();
  }

  UnmodifiableListView<Person> get discoverList =>
      UnmodifiableListView<Person>(_discoverList.map((i) => _people[i]));
}
