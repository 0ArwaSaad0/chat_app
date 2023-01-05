import 'package:chat/base.dart';
import 'package:chat/screens/loin_screen/login_navigator.dart';
import 'package:chat/screens/loin_screen/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/component/text_form_field.dart';

class LoginViewScreen extends StatefulWidget {
  static const String routeName = 'Login';
 static GlobalKey<FormState> formKey = GlobalKey();

  @override
  State<LoginViewScreen> createState() => _LoginViewScreenState();
}

class _LoginViewScreenState extends BaseView<LoginViewScreen, LoginViewModel>
    implements LoginNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Stack(children: [
        Image.asset(
          'assets/images/bg_light.png',
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Login'),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(18.0),
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .21),
              child: Form(
                key: LoginViewScreen.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFields(
                      hintTex: 'Email',
                      textInputType: TextInputType.emailAddress,
                      isVisible: false,
                      messageValidator: 'Enter Email',
                      regX: 'Enter Valid Email',
                      controllerName: emailController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormFields(
                      hintTex: 'Password',
                      textInputType: TextInputType.visiblePassword,
                      isVisible: true,
                      messageValidator: 'Enter Your Password',
                      controllerName: passwordController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ValidateForm();
                        },
                        child: Text('Login'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
  ValidateForm() async {
    if (LoginViewScreen.formKey.currentState!.validate()) {
      viewModel.LoginWihFirebaseAuth(email: emailController.text, password: passwordController.text);
    }
  }
  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }
}
