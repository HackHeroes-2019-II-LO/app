import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Osoba 1"),
            subtitle: Text("Cześć!"),
            onTap: () => Navigator.of(context).pushNamed('/conversation'),
          ),
          ListTile(
            title: Text("Osoba 2"),
            subtitle: Text("Hej!"),
            onTap: () => Navigator.of(context).pushNamed('/conversation'),
          ),
          ListTile(
            title: Text("Osoba 3"),
            subtitle: Text("Cześć!"),
            onTap: () => Navigator.of(context).pushNamed('/conversation'),
          ),
        ],
      ),
    );
  }
}
