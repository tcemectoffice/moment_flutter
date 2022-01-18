import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode emailNode, passwordNode, loginNode;
  late String? fcmToken;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool? passwordVisibility = false;
  String? loginErrorText, passwordErrorText;

  Future<bool> _onWillPop() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit the app?'),
            actions: <Widget>[
              MaterialButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              MaterialButton(
                onPressed: () => exit(0),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: Text('Yes'),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }

  loginSubmit() async {
    if (_loginFormKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => const CustomPopup(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      int response = await services.login(
          emailController.text, passwordController.text, fcmToken!);
      Navigator.of(context).pop(0);
      switch (response) {
        case 1:
          Navigator.pushNamed(context, '/home');
          break;
        case 0:
          setState(() {
            loginErrorText = 'Invalid credentials';
            passwordErrorText = 'Invalid credentials';
          });
          passwordController.clear();
          utils.showSnackMessage(context, 'Invalid Login Credentials');
          break;
        case 2:
          utils.showSnackMessage(context, 'Invalid Access');
          break;
        case 3:
          utils.showSnackMessage(
              context, 'Unknown error occured! Try again later!');
          break;
        case 4:
          utils.showSnackMessage(context, 'No Internet! Try again later!');
          break;
        default:
          utils.showSnackMessage(
              context, 'Unknown error occured! Try again later!');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();
    passwordNode = FocusNode();
    loginNode = FocusNode();
    FirebaseMessaging.instance.getToken().then((String? token) {
      fcmToken = token;
      print('fcm token:' + fcmToken!);
    });
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: WillPopScope(
          onWillPop: _onWillPop,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.info_outline),
                  ),
                ),
              ),
              Container(
                margin: constants.getExtraScreenMargin(context),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomScrollConfig(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width > 400
                              ? 300
                              : 180,
                          margin: const EdgeInsets.all(21.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              constants.appLogoAssetURL,
                              height: MediaQuery.of(context).size.width > 400
                                  ? 300
                                  : 150,
                              width: MediaQuery.of(context).size.width > 400
                                  ? 300
                                  : 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 27.0,
                          ),
                          child: Form(
                            key: _loginFormKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 450,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 4.0),
                                        child: Text('Email:'),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        child: TextFormField(
                                          focusNode: emailNode,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onTap: () {
                                            emailNode.requestFocus();
                                          },
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                          controller: emailController,
                                          textInputAction: TextInputAction.next,
                                          validator: validateTceEmail,
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(12),
                                            isDense: true,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 450,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 4.0),
                                        child: Text('Password:'),
                                      ),
                                      SizedBox(
                                        height: 60,
                                        child: TextFormField(
                                          focusNode: passwordNode,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          onTap: () {
                                            passwordNode.requestFocus();
                                          },
                                          style:
                                              const TextStyle(fontSize: 14.0),
                                          controller: passwordController,
                                          textInputAction: TextInputAction.next,
                                          validator: validatePassword,
                                          obscureText: !passwordVisibility!,
                                          onFieldSubmitted: (String val) {
                                            loginSubmit();
                                          },
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(12),
                                            isDense: true,
                                            suffixIcon: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  passwordVisibility =
                                                      !passwordVisibility!;
                                                });
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Icon(
                                                  !passwordVisibility!
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Colors.grey[600],
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            suffixIconConstraints:
                                                const BoxConstraints(
                                                    minHeight: 2, minWidth: 2),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: MaterialButton(
                                    focusNode: loginNode,
                                    color: const Color(0xFFFBBD49),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 3.0, horizontal: 15.0),
                                      child: const Text(
                                        'Login',
                                        style: TextStyle(fontSize: 18.0),
                                      ),
                                    ),
                                    onPressed: loginSubmit,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
