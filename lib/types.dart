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
      return ChatView();
    case HPTabType.mapView:
      return MapView();
    case HPTabType.discoverView:
      return DiscoverView();
    default:
      return null;
  }
}

typedef HPTabSelector = void Function(HPTabType);
