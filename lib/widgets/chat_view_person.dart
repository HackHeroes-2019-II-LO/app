import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';

class ChatViewPerson extends StatelessWidget {
  final int index;
  final Conversation convo;

  const ChatViewPerson({@required this.index, @required this.convo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        index == 0
            ? SizedBox(
                height: 4,
              )
            : Divider(
                height: 8,
              ),
        ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 48,
            color: Theme.of(context).textTheme.display1.color,
          ),
          title: Text(
            convo.partner,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  '${convo.messages.last.isOwned ? 'Ja' : convo.partner}: ${convo.messages.last.content}',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                DateTime.now().difference(convo.lastTimestamp).inDays > 0
                    ? '${DateTime.now().difference(convo.lastTimestamp).inDays} dni temu'
                    : '${convo.lastTimestamp.hour}:${convo.lastTimestamp.minute}',
              ),
            ],
          ),
          onTap: () => Navigator.of(context).pushNamed(
            AppRoutes.conversation,
            arguments: convo.partner,
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).textTheme.display1.color,
          ),
        ),
      ],
    );
  }
}
