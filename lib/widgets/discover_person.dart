import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';

class DiscoverPerson extends StatelessWidget {
  final Person person;

  const DiscoverPerson({@required this.person}) : assert(person != null);

  @override
  Widget build(BuildContext context) => Card(
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 32,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/64?u=${person.id}'),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    person.name,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${person.age}, ${person.country}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    iconSize: 32,
                    icon: Icon(
                      Icons.person_add,
                    ),
                    onPressed: () => null,
                  ),
                ),
              )
            ],
          ),
        ),
        elevation: 4,
      );
}
