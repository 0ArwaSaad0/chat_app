import 'package:chat/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';

class CreateAccounts extends StatelessWidget {
  static const String routeName = 'create_account';
  static GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
            title: Text('Create Account'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFields(
                      hintTex: 'First Name',
                      textInputType: TextInputType.text,
                      isVisible: false,
                      messageValidator: 'Please Enter your First Name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormFields(
                      hintTex: 'User Name',
                      textInputType: TextInputType.text,
                      isVisible: false,
                      messageValidator: 'Please Enter Your User Name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormFields(
                      hintTex: 'Email',
                      textInputType: TextInputType.emailAddress,
                      isVisible: false,
                      messageValidator: 'Enter Email',
                      regX: 'Enter Valid Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormFields(
                      hintTex: 'Password',
                      textInputType: TextInputType.visiblePassword,
                      isVisible: true,
                      messageValidator: 'Enter Your Password',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            print('helooooooooooooooo');
                          }
                          else{
                            print('chec;');
                          }
                        },
                        child: Text('Create New Account'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // CreateAccount() {
  //   if (formKey.currentState!.validate()) {
  //   return 'Helllllo';
  //   }
  // }
}
