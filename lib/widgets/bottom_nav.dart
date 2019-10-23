import 'package:flutter/material.dart';
import 'package:hack_heroes/widgets/bottom_nav_item.dart';
import 'package:hack_heroes/types.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    @required this.tabs,
    @required this.selected,
    @required this.select,
  })  : assert(tabs != null),
        assert(selected != null),
        assert(select != null);

  final List<HPTabType> tabs;
  final HPTabType selected;
  final HPTabSelector select;

  @override
  Widget build(BuildContext context) => BottomAppBar(
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: tabs
                .map((HPTabType tab) => BottomNavItem(
                      tab: tab,
                      selected: selected,
                      select: select,
                    ))
                .toList(),
          ),
        ),
      );
}
