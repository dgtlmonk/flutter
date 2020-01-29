import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/constants/auth_errors.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String _authError = null;
  bool _showPassword = false;
  bool _isBusy = false;
  String username;
  String password;

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _isBusy,
        color: Colors.blueAccent,
        child: Center(
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
                  if (_authError != null) Text(_authError),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      elevation: 5.0,
                      child: MaterialButton(
                        onPressed: () async {
                          if (username == null || password == null) return;

                          String _errMsg = 'Invalid login';

                          setState(() {
                            _isBusy = true;
                          });

                          await _auth
                              .signInWithEmailAndPassword(
                                  email: username.trim(),
                                  password: password.trim())
                              .then((AuthResult authResult) {
                            print(authResult.user.email);

                            Navigator.pushNamed(context, ChatScreen.id);
                            setState(() {
                              _authError = null;
                            });
                          }).catchError((e) {
                            PlatformException _error = e as PlatformException;

                            _errMsg = kAuthErrors[_error.code] ??
                                kAuthErrors['DEFAULT'];

                            setState(() {
                              _authError = _errMsg;
                            });
                          });

                          setState(() {
                            _isBusy = false;
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
      ),
    );
  }
}
