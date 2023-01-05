import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../shared/component/firebase_error.dart';

class CreateAccountViewModel extends ChangeNotifier {
  void CreateAccountWihFirebaseAuth(
      {required String email, required String password}) async {
    try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        print('The password provided is too weak.');
      } else if (e.code == FirebaseError.emailAlreadyInUse) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
