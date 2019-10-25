import 'package:flutter/material.dart';
import 'package:hack_heroes/views/chat_view.dart';
import 'package:hack_heroes/views/discover_view.dart';
import 'package:hack_heroes/views/map_view.dart';

class AppRoutes {
  static const String home = '/';
  static const String conversation = '/conversation';
  static const String settings = '/settings';
}

class Message {
  final bool isOwned;
  final String content;

  const Message({@required this.isOwned, @required this.content});
}

class Conversation {
  final Person partner;
  final List<Message> messages;
  DateTime lastTimestamp;

  Conversation({
    @required this.partner,
    @required this.messages,
    @required this.lastTimestamp,
  });
}

class Person {
  final int id;
  final String name;
  final String country;
  final int age;

  const Person({
    @required this.id,
    @required this.name,
    @required this.country,
    @required this.age,
  });
}

enum HPTabType {
  chatView,
  mapView,
  discoverView,
}

String tabToTitle(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return 'Czat';
    case HPTabType.discoverView:
      return 'Poznaj';
    case HPTabType.mapView:
      return 'Mapa';
    default:
      return null;
  }
}

IconData tabToIcon(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return Icons.chat;
    case HPTabType.discoverView:
      return Icons.explore;
    case HPTabType.mapView:
      return Icons.map;
    default:
      return null;
  }
}

Widget tabToPage(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return ChatView();
    case HPTabType.discoverView:
      return DiscoverView();
    case HPTabType.mapView:
      return MapView();
    default:
      return null;
  }
}

typedef HPTabSelector = void Function(HPTabType);
