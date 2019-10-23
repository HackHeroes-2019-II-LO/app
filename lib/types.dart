import 'package:flutter/material.dart';
import 'package:hack_heroes/views/chat_view.dart';
import 'package:hack_heroes/views/discover_view.dart';
import 'package:hack_heroes/views/map_view.dart';

enum HPTabType {
  chatView,
  mapView,
  discoverView,
}

String tabToTitle(HPTabType tab) {
  switch (tab) {
    case HPTabType.chatView:
      return 'Chat';
    case HPTabType.discoverView:
      return 'Discover';
    case HPTabType.mapView:
      return 'Map';
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
