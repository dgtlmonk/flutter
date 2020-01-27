import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool _showPassword = false;
  String username;
  String password;
  String authError;

  InputDecoration kTextFieldDecoration = InputDecoration(
    hintStyle: TextStyle(color: Colors.black12),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      //Do something with the user input.
                      username = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter username/email')),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: !_showPassword,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                        color: Colors.black38,
                      ),
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                if (authError != null) Text(authError),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async {
                        String _errMsg = 'Invalid login';

                        //Implement login functionality.
                        print(username + password);
                        await _auth
                            .signInWithEmailAndPassword(
                                email: username, password: password)
                            .catchError((e) {
                          PlatformException _error = e as PlatformException;

                          if (_error.code == 'ERROR_INVALID_EMAIL') {
                            _errMsg = 'Invalid email';
                          }

                          if (_error.code == 'ERROR_WRONG_PASSWORD') {
                            _errMsg = 'Wrong password';
                          }

                          setState(() {
                            authError = _errMsg;
                          });
                        });
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      //Implement login functionality.
                      Navigator.pop(context);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Cancel',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
