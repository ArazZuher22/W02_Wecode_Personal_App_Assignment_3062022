import 'package:flutter/material.dart';

class MessagesBoardScreenView extends StatefulWidget {
  const MessagesBoardScreenView({Key? key}) : super(key: key);

  @override
  State<MessagesBoardScreenView> createState() => MessagesBoardScreenViewState();
}

class MessagesBoardScreenViewState extends State<MessagesBoardScreenView> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:Text("Message"),),
        body: Center(
          child:Text(" This is Message Page "),
          ),
      ),
       
    );
  }
}
