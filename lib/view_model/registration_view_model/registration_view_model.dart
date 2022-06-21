import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_registration_form/constants/colors.dart';
import 'package:mvvm_registration_form/views/registration_form/address_info.dart';

import '../../components/enums.dart';
import '../../utils/custom_red_snakbar.dart';
import '../../views/registration_form/educational_info.dart';

class RegistrationViewModel extends ChangeNotifier {
  //* Variables --------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  var genderType = Gender.male;
  bool isObscure = true;
  File? pickedImage; // Null if image is not picked
  Education? intialSelectedCourse;
  String intialSelectedYear = "";
  String intialSelectedDesignation = "";
  String intialSelectedDomain = "";
  String intialSelectedState = "";

  //* Dropdown Lists ------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  //* Course Dropdown Lists ----------->>>>>>>>>>>
  // List<String> qualificationList = [
  //   "B.Tech",
  //   "B.Pharma",
  //   "B.A.",
  //   "M.A.",
  //   "B.Com.",
  //   "MBA",
  // ];
  Map<Education, String> educationMap = {
    Education.graduate: "Graduate",
    Education.hscDiploma: "HSC/Diploma",
    Education.postGraduate: "Post Graduate",
    Education.ssc: "SSC",
  };

  //* Passing Year Dropdown Lists ----------->>>>>>>>>>>
  List<String> stateList = [
    "Maharastra",
    "Gujarat",
    "Karnataka",
    "MadhyaPradesh",
    "Delhi",
    "Others"
  ];

  List<String> yearList = [
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
  ];

  //* Designation Dropdown lists ------------->>>>>>
  List<String> designationlist = [
    "CEO",
    "MD",
    "Team Lead",
  ];
  //* Domain Dropdown lists ------------->>>>>>
  List<String> domainList = [
    "Machine Learning",
    "Robotics",
    "Data Mining",
  ];

  //* Form Keys ---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  GlobalKey<FormState> basicInfoFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> educationalFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  //* TextFormField controllers -------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  //* Form Validations ------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  String? validAddress(adrs) {
    if (adrs.toString().length < 3) {
      return "Please enter your Address";
    } else {
      return null;
    }
  }

  String? validLandmark(land) {
    if (land.toString().length < 3) {
      return "Please enter Nearby Location as Landmark";
    } else {
      return null;
    }
  }

  String? validCity(city) {
    if (city.toString().length < 3) {
      return "Please enter your city";
    } else {
      return null;
    }
  }

  String? validPinCode(zip) {
    if (zip.toString().length < 6) {
      return "Please enter 6 Digit zip code";
    } else {
      return null;
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

  String? validExperience(exp) {
    if (exp.toString().isEmpty) {
      return "Please Enter your no. of exprienced year.";
    } else {
      return null;
    }
  }

  String? validGrade(grd) {
    if (grd.toString().isEmpty) {
      return "Please enter your grades";
    } else {
      return null;
    }
  }

  bool validateDropDownFields(BuildContext context) {
    if (intialSelectedCourse == null ||
        intialSelectedYear.isEmpty ||
        intialSelectedDesignation.isEmpty ||
        intialSelectedDomain.isEmpty) {
      customRedSnakbar(
        context: context,
        title: "Empty Selection Fields",
        body:
            "Selection of Educatoin, Year of Passing, Designation and Domain are required.",
      );

      return false;
    } else {
      return true;
    }
  }

  //* Other Methods ---------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  //* Get list of String from enum ----->>>>
  List<String> getListOfQualificationString() {
    List<String> lis = [];
    educationMap.forEach((key, value) {
      lis.add(value);
    });
    return lis;
  }

  void qualificationOnChange(selectedCourse) {
    educationMap.forEach((key, value) {
      if (value == selectedCourse) {
        intialSelectedCourse = key;
      }
    });

    notifyListeners();
  }

  void stateOnChnage(selectedState) {
    intialSelectedState = selectedState ?? "";
    notifyListeners();
  }

  void yearListOnChange(selctedYear) {
    intialSelectedYear = selctedYear ?? "";
    notifyListeners();
  }

  void designationOnChange(selectedDesignation) {
    intialSelectedDesignation = selectedDesignation ?? "";
    notifyListeners();
  }

  void domainOnChange(selectedDomain) {
    intialSelectedDomain = selectedDomain ?? "";
    notifyListeners();
  }

  void nextButtonBasic(BuildContext context) {
    if (pickedImage == null) {
      customRedSnakbar(
          context: context,
          title: "Profile picture is required",
          body: "Please select an image.");
    } else {
      if (basicInfoFormKey.currentState!.validate()) {
        log("Basic info form is valid");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EducationalInfo(),
        ));
      }
    }
  }

  void nextButtonEducational(BuildContext context) {
    if (validateDropDownFields(context)) {
      if (educationalFormKey.currentState!.validate()) {
        log("Educational info form is valid");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddressInfo(),
        ));
      }
    }
  }

  void submitButton(BuildContext context) {
    if (addressFormKey.currentState!.validate()) {
      if (intialSelectedState.isEmpty) {
        customRedSnakbar(
          context: context,
          title: "Empty Selection Fields",
          body: "Selection of your state is required",
        );
      } else {
        log("Address form valid");
      }
    }
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
  //* Image Picker for registration form ------>>>>>>>>>

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
                color: LIGHT_BLUE_COLOR,
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
                        color: LIGHT_BLUE_COLOR,
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.account_box,
                      color: LIGHT_BLUE_COLOR,
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
                        color: LIGHT_BLUE_COLOR,
                        fontFamily: "SofiaPro",
                      ),
                    ),
                    leading: const Icon(
                      Icons.camera,
                      color: LIGHT_BLUE_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
