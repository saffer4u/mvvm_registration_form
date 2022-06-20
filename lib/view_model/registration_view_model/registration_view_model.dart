import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/enums.dart';

class RegistrationViewModel extends ChangeNotifier {
  // Variables --------->>>>>>>>>>
  var genderType = Gender.male;
  bool isObscure = true;
  File? pickedImage; // Null if image is not picked

  // Form Keys ---------->>>>>>>>>>>>
  GlobalKey<FormState> basicInfoFormKey = GlobalKey<FormState>();

  // TextFormField controllers -------->>>>>>>>>>
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Form Validations ------------>>>>>>>>>>

  void nextButton() {
    if (basicInfoFormKey.currentState!.validate()) {
      log("Basic info form is valid");
    }
  }

  String? validpassword(String? value) {
    if (value!.length < 6) {
      return "Password must contain Special, Captial, Small and Numeric Characters";
    } else {
      return null;
    }
  }

  String? validFirstName(String? fname) {
    if (fname!.length < 3) {
      return "First Name atleast have 3 characters";
    } else {
      return null;
    }
  }

  String? validConfirmPassword(String? cpass) {
    if (confirmPasswordController.text != passwordController.text ||
        confirmPasswordController.text.isEmpty) {
      return "Password does not match";
    } else {
      return null;
    }
  }

  String? validLastName(String? lname) {
    if (lname!.length < 3) {
      return "Last Name atleast have 3 characters";
    } else {
      return null;
    }
  }

  String? validPhoneNo(String? phone) {
    if (phone!.length < 10) {
      return "Enter a valid phone. no";
    } else {
      return null;
    }
  }

  String? validEmail(email) {
    if (email!.isEmpty || email == null) {
      return "Email Field cann't be Empty";
    } else if (!emailRex.hasMatch(email)) {
      return "Enter a valid Email";
    }
    return null;
  }

  RegExp emailRex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  void toggleObscure() {
    if (isObscure) {
      isObscure = false;
    } else {
      isObscure = true;
    }
    notifyListeners();
  }

  void checkGender(Gender gen) {
    genderType = gen;
    notifyListeners();
  }

  // Image Picker for registration form ------>>>>>>>>>

  //* Pic image from camera   ---->>>>>>>>>>>>
  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    notifyListeners();
  }

  //* Pic image from gallery >>>>>>>>>>>>
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      pickedImage = File(pickedFile.path);
    } else {
      pickedImage = null;
    }
    notifyListeners();
  }

  //* Image picker Alert Dialog >>>>>>>>>
  Future<void> picImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            title: const Text(
              "Choose option",
              style: TextStyle(
                color: Color(0xff779FE5),
                fontFamily: "SofiaPro",
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                      Navigator.of(context).pop();
                    },
                    title: const Text(
                      "Gallery",
                      style: TextStyle(
                        color: Color(0xff779FE5),
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff779FE5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                      Navigator.of(context).pop();
                    },
                    title: const Text(
                      "Camera",
                      style: TextStyle(
                        color: Color(0xff779FE5),
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff779FE5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
