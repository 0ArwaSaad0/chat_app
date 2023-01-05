import 'package:chat/base.dart';
import 'package:chat/screens/create_account/create_account_navigator.dart';
import 'package:chat/screens/create_account/create_account_viewModel.dart';
import 'package:chat/shared/component/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccounts extends StatefulWidget {
  static const String routeName = 'create_account';
  static GlobalKey<FormState> formKey = GlobalKey();

  @override
  State<CreateAccounts> createState() => _CreateAccountsState();
}

class _CreateAccountsState
    extends BaseView<CreateAccounts, CreateAccountViewModel>
    implements CreateAccountNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController secendNameController = TextEditingController();

  // CreateAccountViewModel accountViewModel = CreateAccountViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => viewModel,
      child: Stack(
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
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(18.0),
                margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .21),
                child: Form(
                  key: CreateAccounts.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormFields(
                        hintTex: 'First Name',
                        textInputType: TextInputType.text,
                        isVisible: false,
                        messageValidator: 'Please Enter your First Name',
                        controllerName: firstNameController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormFields(
                        hintTex: 'Secend Name',
                        textInputType: TextInputType.text,
                        isVisible: false,
                        messageValidator: 'Please Enter Your Secend Name',
                        controllerName: secendNameController,
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
                            CreateAccount();
                          },
                          child: Text('Create New Account'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CreateAccount() async {
    if (CreateAccounts.formKey.currentState!.validate()) {
      viewModel.CreateAccountWihFirebaseAuth(
          email: emailController.text, password: passwordController.text);
    }
  }

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }
}
