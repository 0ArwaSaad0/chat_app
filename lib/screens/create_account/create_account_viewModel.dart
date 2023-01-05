import 'package:chat/base.dart';
import 'package:chat/screens/create_account/create_account_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../shared/component/firebase_error.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {

  void CreateAccountWihFirebaseAuth(
      {required String email, required String password}) async {
    navigator!.showLoading();
    try {
      final cradentail =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      navigator!.hideLoading();
      navigator!.showMessage('Created Done', 'OK');
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        navigator!.hideLoading();
        navigator!.showMessage('The password provided is too weak.',"Try Again");

        //print('The password provided is too weak.');
      } else if (e.code == FirebaseError.emailAlreadyInUse) {
        navigator!.hideLoading();
        navigator!.showMessage(
            'The account already exists for that email.', 'Cancel');
        print('The account already exists for that email.');
      }
    } catch (e) {
      navigator!.hideLoading();
      navigator!.showMessage('error is $e');
      print(e);
    }
  }
}
