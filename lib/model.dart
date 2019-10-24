import 'dart:collection';

import 'package:hack_heroes/types.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {
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
}
