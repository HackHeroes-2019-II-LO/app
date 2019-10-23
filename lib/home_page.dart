import 'package:flutter/material.dart';
import 'package:hack_heroes/widgets/bottom_nav.dart';
import 'package:hack_heroes/widgets/app_bar.dart';
import 'package:hack_heroes/types.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static final List<HPTabType> _tabs = <HPTabType>[
    HPTabType.chatView,
    HPTabType.mapView,
    HPTabType.discoverView
  ];

  HPTabType _currentTab = _tabs[0];
  final PageController _pageController = PageController();
  AnimationController _sheetAnimation;

  void _changeTab(HPTabType tab, [bool fromPageView = false]) {
    setState(() {
      _currentTab = tab;
    });
    if (!fromPageView) {
      _pageController.animateToPage(
        _tabs.indexOf(tab),
        duration: kThemeAnimationDuration,
        curve: Curves.linear,
      );
    }
  }

  @override
  void initState() {
    _sheetAnimation = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    );
    super.initState();
  }

  @override
  void dispose() {
    _sheetAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: ToDoAppBar(
          texts: _tabs.map(tabToTitle).toList(),
          selected: _tabs.indexOf(_currentTab),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (int page) => _changeTab(_tabs[page], true),
          children: _tabs.map(tabToPage).toList(),
        ),
        bottomNavigationBar: BottomNav(
          tabs: _tabs,
          selected: _currentTab,
          select: _changeTab,
        ),
      );
}
