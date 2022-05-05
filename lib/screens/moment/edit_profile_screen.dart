import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/screens/base/home_screen.dart';
import 'package:moment/utils/validations.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final String name, regNum, email, phone, dp;
  const EditProfile({
    Key? key,
    required this.name,
    required this.regNum,
    required this.email,
    required this.phone,
    required this.dp,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late FocusNode nameNode, regNumNode, emailNode, phoneNode, submitNode;
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      regNumController,
      emailController,
      phoneController;
  File? dp;

  void pickFiles() async {
    FilePickerResult? filePicker =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePicker != null && filePicker.files.first.path != null) {
      setState(() {
        dp = File(filePicker.files.first.path!);
      });
      print(dp!.path);
    }
  }

  editProfile() async {
    if (_editProfileFormKey.currentState!.validate()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const CustomPopup(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      var name =
          nameController.text == widget.name || nameController.text.isEmpty
              ? null
              : nameController.text;
      var regNum = regNumController.text == widget.regNum ||
              regNumController.text.isEmpty
          ? null
          : regNumController.text;
      var email =
          emailController.text == widget.email || emailController.text.isEmpty
              ? null
              : emailController.text;
      var phone =
          phoneController.text == widget.phone || phoneController.text.isEmpty
              ? null
              : phoneController.text;

      print(name);
      print(regNum);
      print(phone);
      print(email);
      print(dp);
      if (name == null &&
          phone == null &&
          email == null &&
          phone == null &&
          dp == null) {
        utils.showSnackMessage(context, 'No Changes to be saved!');
        Navigator.of(context).pop(0);
      } else {
        bool response =
            await services.editProfile(name, regNum, email, phone, dp);
        Navigator.of(context).pop(0);
        if (response) {
          Provider.of<HomePageNotifier>(context, listen: false)
              .setIndex(0, context);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const HomeScreen()),
            ),
          );
        } else {
          utils.showSnackMessage(
              context, 'Unknown error occured! Try again later!');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    nameNode = FocusNode();
    regNumNode = FocusNode();
    emailNode = FocusNode();
    phoneNode = FocusNode();
    submitNode = FocusNode();
    nameController =
        TextEditingController.fromValue(TextEditingValue(text: widget.name));
    regNumController =
        TextEditingController.fromValue(TextEditingValue(text: widget.regNum));
    emailController =
        TextEditingController.fromValue(TextEditingValue(text: widget.email));
    phoneController =
        TextEditingController.fromValue(TextEditingValue(text: widget.phone));
  }

  @override
  void dispose() {
    nameNode.dispose();
    regNumNode.dispose();
    emailNode.dispose();
    phoneNode.dispose();
    submitNode.dispose();
    nameController.dispose();
    regNumController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          actions: [
            TextButton(
              onPressed: editProfile,
              focusNode: submitNode,
              child: const Text('Save'),
            )
          ],
          title: const Text('Edit Profile'),
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          margin: utils.getScreenMargins(context, extra: 20),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CustomScrollConfig(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  GestureDetector(
                    onTap: pickFiles,
                    child: CircleAvatar(
                      radius:
                          MediaQuery.of(context).size.width > 400 ? 100 : 75,
                      backgroundImage: dp == null
                          ? serverImageProvider(widget.dp)
                          : FileImage(dp!) as ImageProvider,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 27.0,
                    ),
                    child: Form(
                      key: _editProfileFormKey,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(bottom: 4.0, top: 20),
                                  child: Text('Name:'),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: nameNode,
                                    keyboardType: TextInputType.name,
                                    onTap: () {
                                      nameNode.requestFocus();
                                    },
                                    style: const TextStyle(fontSize: 14.0),
                                    controller: nameController,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      return validateName(value,
                                          isOptional: true);
                                    },
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text('Register Number:'),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: regNumNode,
                                    keyboardType: TextInputType.text,
                                    onTap: () {
                                      regNumNode.requestFocus();
                                    },
                                    style: const TextStyle(fontSize: 14.0),
                                    controller: regNumController,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      return validateRegNum(value,
                                          isOptional: true);
                                    },
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text('Phone Number:'),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: phoneNode,
                                    keyboardType: TextInputType.number,
                                    onTap: () {
                                      phoneNode.requestFocus();
                                    },
                                    style: const TextStyle(fontSize: 14.0),
                                    controller: phoneController,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      return validatePhone(value,
                                          isOptional: true);
                                    },
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Text('Alternate Email:'),
                                ),
                                SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    focusNode: emailNode,
                                    keyboardType: TextInputType.emailAddress,
                                    onTap: () {
                                      emailNode.requestFocus();
                                    },
                                    style: const TextStyle(fontSize: 14.0),
                                    controller: emailController,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      return validateEmail(value,
                                          isOptional: true);
                                    },
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(12),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
