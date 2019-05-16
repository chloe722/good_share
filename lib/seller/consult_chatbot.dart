import 'package:flutter/material.dart';

class ConsultChatbot extends StatefulWidget {
  @override
  _ConsultChatbotState createState() => _ConsultChatbotState();
}

class _ConsultChatbotState extends State<ConsultChatbot> {

  final TextEditingController _textController = new TextEditingController();

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                controller: _textController,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {}
                  ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      children: <Widget>[
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
        BotMessenging(messenge: 'No probram,anything else I can help you?', width: 150.0,),
        UserMessenging(messenge: 'Thank you', width: 100.0,),
        BotMessenging(messenge: 'Here is the course I can find for you:\n https://alison.com/tag/accounting', width: 200.0,),
        UserMessenging(messenge: 'I\m looking for accounting course for starting business', width: 200.0,),
        BotMessenging(messenge: 'Hi, what can I help you?', width: 170.0,),
        UserMessenging(messenge: 'Hi', width: 100.0,),
//        UserMessenging(messenge: 'Hi'),

      ],
    );
  }
}


class BotMessenging extends StatelessWidget {
  final String messenge;
  final double width;

  BotMessenging({this.messenge, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('image/chatbot.png'), fit: BoxFit.cover)),
              ),
              Text('Support')
            ],
          ),
          SizedBox(width: 20.0),
          Container(
            width: width,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.amber[300]),
            child: Text(
              messenge, style: TextStyle(color: Colors.grey[700]),
            ),
          )
        ],
      ),
    );
  }
}

class UserMessenging extends StatelessWidget {
  final String messenge;
  final double width;

  UserMessenging({this.messenge, this.width});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0, bottom: 15.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              Container(
              width: width,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.amber[300]),
              child: Text(
                messenge, style: TextStyle(color: Colors.grey[700], fontSize: 18.0),
              ),
            ),
            SizedBox(width: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage('image/avatar.jpg'), fit: BoxFit.cover)),
                ),
                Text('You')
              ],
            ),
          ],
        ),
      ),
    );
  }
}