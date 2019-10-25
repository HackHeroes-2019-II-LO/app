import 'package:flutter/material.dart';
import 'package:hack_heroes/model.dart';
import 'package:hack_heroes/types.dart';
import 'package:hack_heroes/widgets/app_bar.dart';
import 'package:hack_heroes/widgets/chat_bubble.dart';
import 'package:scoped_model/scoped_model.dart';

class ConversationView extends StatelessWidget {
  final _textController = TextEditingController();

  void _send(BuildContext context) {
    if (_textController.text.length > 0) {
      AppModel.of(context).addMessage(
          ModalRoute.of(context).settings.arguments, _textController.text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final Person partner = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: ToDoAppBar(
        texts: [partner.name],
        center: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ScopedModelDescendant<AppModel>(
              builder: (context, child, model) {
                final convo = model.convoWith(partner);
                return ListView.builder(
                  reverse: true,
                  itemBuilder: (context, index) => ChatBubble(
                    message: convo.messages[convo.messages.length - index - 1],
                  ),
                  itemCount: convo.messages.length,
                );
              },
            ),
          ),
          Container(
            color: Theme.of(context).cardColor,
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: TextField(
                      controller: _textController,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.text,
                      maxLines: 1,
                      onEditingComplete: () => _send(context),
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        hintText: 'Aa',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        filled: true,
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).textTheme.display1.color,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            width: 1,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, child) => IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _textController.text.length > 0
                        ? () => _send(context)
                        : null,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
