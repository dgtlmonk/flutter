import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

Firestore firestore = Firestore.instance;
FirebaseUser loggedInUser;

BorderRadius kBorderRadiusLoggedInUser = BorderRadius.only(
  topLeft: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);

BorderRadius kBorderRadiusOtherUsers = BorderRadius.only(
  topRight: Radius.circular(30),
  bottomLeft: Radius.circular(30),
  bottomRight: Radius.circular(30),
);

class ChatScreen extends StatefulWidget {
  static const id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextCtrl = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String messageText;

  Future<FirebaseUser> getCurrentUser() async {
    try {
      loggedInUser = await _auth.currentUser();
      if (loggedInUser != null) {
        print('User detected as ' + loggedInUser.email);
      }
    } catch (e) {
      print('unable to retrieve user');
    }
  }

  // message stream listener
  void messageStream() async {
    await for (var snaphot in firestore.collection('messages').snapshots()) {
      for (var messages in snaphot.documents) {
        print(messages.data);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    messageStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(firestore: firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      controller: messageTextCtrl,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextCtrl.clear();
                      //Implement send functionality.
                      firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key key,
    @required this.firestore,
  }) : super(key: key);

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }

          final messages = snapshot.data.documents.reversed;
          List<Widget> messageWidgets = [];

          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            final isCurrentUser = loggedInUser.email != null &&
                loggedInUser.email == messageSender;

            final messageWidget = Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: isCurrentUser
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(isCurrentUser
                        ? 'https://i.pravatar.cc/309'
                        : 'https://i.pravatar.cc/307'),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '$messageSender',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 4.00,
                      ),
                      Material(
                        borderRadius: isCurrentUser
                            ? kBorderRadiusLoggedInUser
                            : kBorderRadiusOtherUsers,
                        color: Colors.blueGrey,
                        elevation: 2.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '$messageText',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );

            messageWidgets.add((messageWidget));
          }

          // NOTE: Expanded is necessary
          // so that the list wont take ALL the screen space,
          // but only the available space
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageWidgets,
            ),
          );
        });
  }
}
