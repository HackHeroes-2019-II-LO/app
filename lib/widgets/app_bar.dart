import 'package:flutter/material.dart';

class ToDoAppBar extends AppBar {
  ToDoAppBar({
    @required this.texts,
    this.selected = 0,
    this.center = true,
    this.actions,
    this.leading,
  })  : assert(texts != null),
        assert(selected != null),
        assert(center != null),
        super(
          title: AnimatedSwitcher(
            child: Text(
              texts[selected],
              key: Key(texts[selected]),
            ),
            duration: kThemeAnimationDuration,
          ),
          centerTitle: center,
          actions: actions,
          leading: leading,
        );

  final List<String> texts;
  final int selected;
  final bool center;
  final List<Widget> actions;
  final Widget leading;
}
