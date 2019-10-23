import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    @required this.tab,
    @required this.selected,
    @required this.select,
  })  : assert(tab != null),
        assert(selected != null);

  final HPTabType tab;
  final HPTabType selected;
  final HPTabSelector select;

  bool get isActive => tab == selected;

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
                    tabToIcon(tab),
                    color: Theme.of(context).textTheme.display1.color,
                  ),
                  secondChild: Icon(
                    tabToIcon(tab),
                    color: Theme.of(context).textTheme.body1.color,
                  ),
                  duration: kThemeAnimationDuration,
                  crossFadeState: isActive
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
                AnimatedCrossFade(
                  firstChild: Text(
                    tabToTitle(tab),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.display1.color,
                    ),
                  ),
                  secondChild: Text(tabToTitle(tab)),
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
