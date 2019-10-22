import 'package:flutter/material.dart';

class AppBarSecondText {
  const AppBarSecondText({
    @required this.text,
    @required this.active,
  })  : assert(text != null),
        assert(active != null);

  final String text;
  final bool active;
}

class ToDoAppBar extends AppBar {
  ToDoAppBar({
    @required this.text,
    this.secondText,
    this.actions,
    this.leading,
  })  : assert(text != null),
        super(
          title: secondText != null
              ? AnimatedSwitcher(
                  child: secondText.active
                      ? Text(
                          secondText.text,
                          key: Key(secondText.text),
                        )
                      : Text(
                          text,
                          key: Key(text),
                        ),
                  duration: kThemeAnimationDuration,
                )
              : Text(text),
          centerTitle: true,
          actions: actions,
          leading: leading,
        );

  final String text;
  final AppBarSecondText secondText;
  final List<Widget> actions;
  final Widget leading;
}
