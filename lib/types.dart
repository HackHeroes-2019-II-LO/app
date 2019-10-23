import 'package:flutter/material.dart';

enum HPTabType {
  chatView,
  mapView,
  discoverView,
}

String tabToTitle(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return 'Chat';
    case HPTabType.mapView:
      return 'Map';
    case HPTabType.discoverView:
      return 'Discover';
    default:
      return null;
  }
}

IconData tabToIcon(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return Icons.chat;
    case HPTabType.mapView:
      return Icons.map;
    case HPTabType.discoverView:
      return Icons.explore;
    default:
      return null;
  }
}

Widget tabToPage(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return Material(color: Colors.red);
    case HPTabType.mapView:
      return Material(color: Colors.green);
    case HPTabType.discoverView:
      return Material(color: Colors.blue);
    default:
      return null;
  }
}

typedef HPTabSelector = void Function(HPTabType);
