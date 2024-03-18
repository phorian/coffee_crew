import 'dart:async';

import 'package:coffee_crew/models/user.dart' as UserModal;
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on User?

  _userFromFirebaseUser(User? user) {
    return user != null ? UserModal.UserModel(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<UserModal.UserModel?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));
    //.map(_userFromFirebaseUser);

  }


  // Sign in anonymously
  Future signInAnon() async {
    try{
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }


  // register with email & password
  Future regWithEmailnPwd(String email, String password) async {
    try{
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // sign in with email & password



  // sign out
  Future SignOut() async{
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}