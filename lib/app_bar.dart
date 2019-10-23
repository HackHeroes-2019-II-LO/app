import 'package:flutter/material.dart';

class ToDoAppBar extends AppBar {
  ToDoAppBar({
    @required this.texts,
    this.selected = 0,
    this.actions,
    this.leading,
  })  : assert(texts != null),
        assert(selected != null),
        super(
          title: AnimatedSwitcher(
            child: Text(
              texts[selected],
              key: Key(texts[selected]),
            ),
            duration: kThemeAnimationDuration,
          ),
          centerTitle: true,
          actions: actions,
          leading: leading,
        );

  final List<String> texts;
  final int selected;
  final List<Widget> actions;
  final Widget leading;
}
