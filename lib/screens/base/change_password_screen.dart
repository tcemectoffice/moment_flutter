import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/validations.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late FocusNode oldPasswordNode, newPasswordNode, rePasswordNode, submitNode;
  final GlobalKey<FormState> _passFormKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  bool? oldPasswordVisibility = false;
  bool? newPasswordVisibility = false;
  bool? rePasswordVisibility = false;

  changePassword() async {
    if (_passFormKey.currentState!.validate()) {
      if (newPasswordController.text == rePasswordController.text) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => const CustomPopup(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
        bool response = await services.changePassword(
            oldPasswordController.text, newPasswordController.text);
        Navigator.of(context).pop(0);
        if (response) {
          Navigator.pushNamed(context, '/home');
          utils.showSnackMessage(context, 'Password changed successfully!');
        } else {
          oldPasswordController.clear();
          newPasswordController.clear();
          rePasswordController.clear();
          utils.showSnackMessage(context, 'Invalid Credentials');
        }
      } else {
        utils.showSnackMessage(context, "Passwords don't match");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    oldPasswordNode = FocusNode();
    newPasswordNode = FocusNode();
    rePasswordNode = FocusNode();
    submitNode = FocusNode();
  }

  @override
  void dispose() {
    oldPasswordNode.dispose();
    newPasswordNode.dispose();
    rePasswordNode.dispose();
    submitNode.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text("Change Password"),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Container(
          margin: utils.getScreenMargins(context, extra: 20),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 27.0,
                ),
                child: Form(
                  key: _passFormKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7.0),
                              child: Text('Old Password:'),
                            ),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                focusNode: oldPasswordNode,
                                keyboardType: TextInputType.visiblePassword,
                                onTap: () {
                                  oldPasswordNode.requestFocus();
                                },
                                style: const TextStyle(fontSize: 14.0),
                                controller: oldPasswordController,
                                textInputAction: TextInputAction.next,
                                validator: validatePassword,
                                obscureText: !oldPasswordVisibility!,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(12),
                                  isDense: true,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        oldPasswordVisibility =
                                            !oldPasswordVisibility!;
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        !oldPasswordVisibility!
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[600],
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints: const BoxConstraints(
                                      minHeight: 2, minWidth: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7.0),
                              child: Text('New Password:'),
                            ),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                focusNode: newPasswordNode,
                                keyboardType: TextInputType.visiblePassword,
                                onTap: () {
                                  newPasswordNode.requestFocus();
                                },
                                style: const TextStyle(fontSize: 14.0),
                                controller: newPasswordController,
                                textInputAction: TextInputAction.next,
                                validator: validatePassword,
                                obscureText: !newPasswordVisibility!,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(12),
                                  isDense: true,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        newPasswordVisibility =
                                            !newPasswordVisibility!;
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        !newPasswordVisibility!
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[600],
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints: const BoxConstraints(
                                      minHeight: 2, minWidth: 2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 450,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7.0),
                              child: Text('Re-Type Password:'),
                            ),
                            SizedBox(
                              height: 60,
                              child: TextFormField(
                                focusNode: rePasswordNode,
                                keyboardType: TextInputType.visiblePassword,
                                onTap: () {
                                  rePasswordNode.requestFocus();
                                },
                                style: const TextStyle(fontSize: 14.0),
                                controller: rePasswordController,
                                textInputAction: TextInputAction.next,
                                validator: validatePassword,
                                obscureText: !rePasswordVisibility!,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(12),
                                  isDense: true,
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        rePasswordVisibility =
                                            !rePasswordVisibility!;
                                      });
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Icon(
                                        !rePasswordVisibility!
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.grey[600],
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  suffixIconConstraints: const BoxConstraints(
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
                          focusNode: submitNode,
                          color: const Color(0xFFFBBD49),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3.0, horizontal: 15.0),
                            child: const Text(
                              'Submit',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          onPressed: changePassword,
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
    );
  }
}
