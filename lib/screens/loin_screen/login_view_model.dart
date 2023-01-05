import 'package:chat/screens/loin_screen/login_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../base.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  void LoginWihFirebaseAuth(
      {required String email, required String password}) async {
    navigator!.showLoading();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      navigator!.hideLoading();
      navigator!.showMessage('Successful Login', "OK");
    } on FirebaseAuthException catch (e) {
      navigator!.hideLoading();
      navigator!.showMessage('Something Wrong $e', "Try Again");
    } catch (e) {
      navigator!.hideLoading();
      navigator!.showMessage('error is $e');
      //print(e);
    }
  }
}
