import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  get _auth => FirebaseAuth.instance;
  final String _authError = null;

  init() {
    print('init called');
  }

  onError() {
    print('onError');
  }
}
