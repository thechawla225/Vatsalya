import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<String> SignInWithEmailAndPassword(String email , String password);
  Future<String> CreateUserWithEmailAndPassword(String email , String password);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth
{
  Future<String> SignInWithEmailAndPassword(String email , String password)
  async{
    FirebaseUser users = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    return users.uid;
  }
  Future<String> CreateUserWithEmailAndPassword(String email , String password)
  async{
    FirebaseUser users = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
    return users.uid;
  }
  Future<String> currentUser()
  async{
    FirebaseUser users = await FirebaseAuth.instance.currentUser();
    return users.uid;
  }
  Future<void> signOut()
  async{
    return FirebaseAuth.instance.signOut();
  }

}
