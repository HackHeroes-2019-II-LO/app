import 'package:flutter/material.dart';
import 'package:hack_heroes/types.dart';

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({@required this.message});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment:
            message.isOwned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(0.2),
                )
              ],
              color: message.isOwned
                  ? Theme.of(context).accentColor.withOpacity(0.5)
                  : Theme.of(context).cardColor,
              borderRadius: message.isOwned
                  ? BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(8),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(12),
                    ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 2,
            ),
            child: Text(
              message.content,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      );
}
