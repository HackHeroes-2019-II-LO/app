import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    @required this.tab,
    @required this.selected,
    @required this.select,
  })  : assert(tab != null),
        assert(selected != null);

  static String _tabToTitle(HPTabType tab) {
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

  final HPTabType tab;
  final HPTabType selected;
  final HPTabSelector select;

  bool get isActive => tab == selected;

  IconData get iconData {
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

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          onTap: isActive ? null : () => select(tab),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedCrossFade(
                  firstChild: Icon(
                    iconData,
                    color: Theme.of(context).textTheme.display1.color,
                  ),
                  secondChild: Icon(
                    iconData,
                    color: Theme.of(context).textTheme.body1.color,
                  ),
                  duration: kThemeAnimationDuration,
                  crossFadeState: isActive
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                AnimatedCrossFade(
                  firstChild: Text(
                    _tabToTitle(tab),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.display1.color,
                    ),
                  ),
                  secondChild: Text(_tabToTitle(tab)),
                  duration: kThemeAnimationDuration,
                  crossFadeState: isActive
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ],
            ),
          ),
        ),
      );
}
