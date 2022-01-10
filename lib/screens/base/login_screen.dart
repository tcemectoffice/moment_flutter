import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/constants.dart' as constants;
import 'package:moment/utils/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode emailNode, passwordNode, loginNode;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit the app?'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              MaterialButton(
                onPressed: () => exit(0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text('Yes'),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  loginSubmit() {
    if (_loginFormKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();
    emailNode = new FocusNode();
    passwordNode = new FocusNode();
    loginNode = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    loginNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      resizeToAvoidBottomInset: true,
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          margin: constants.getExtraScreenMargin(context),
          child: CustomScrollConfig(
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width > 400 ? 128 : 24,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width > 400 ? 300 : 180,
                    margin: EdgeInsets.all(27.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        constants.appLogoAssetURL,
                        height:
                            MediaQuery.of(context).size.width > 400 ? 300 : 180,
                        width:
                            MediaQuery.of(context).size.width > 400 ? 300 : 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 27.0,
                  ),
                  child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          Container(
                            width: 450,
                            padding: EdgeInsets.all(12.0),
                            child: TextFormField(
                              focusNode: emailNode,
                              onTap: () {
                                emailNode.requestFocus();
                              },
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              validator: validateTceEmail,
                              decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 18.0),
                                enabledBorder:
                                    constants.textFormFieldEnabledBorder,
                                focusedBorder:
                                    constants.textFormFieldFocusedBorder,
                                errorBorder: constants.textFormFieldErrorBorder,
                              ),
                            ),
                          ),
                          Container(
                            width: 450,
                            padding: EdgeInsets.all(12.0),
                            child: TextFormField(
                              focusNode: passwordNode,
                              onTap: () {
                                passwordNode.requestFocus();
                              },
                              controller: passwordController,
                              textInputAction: TextInputAction.next,
                              validator: validatePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 18.0),
                                enabledBorder:
                                    constants.textFormFieldEnabledBorder,
                                focusedBorder:
                                    constants.textFormFieldFocusedBorder,
                                errorBorder: constants.textFormFieldErrorBorder,
                              ),
                              obscureText: true,
                              onFieldSubmitted: (String val) {
                                loginSubmit();
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 36.0),
                            child: MaterialButton(
                              focusNode: loginNode,
                              color: Colors.green[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 24.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              onPressed: loginSubmit,
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
