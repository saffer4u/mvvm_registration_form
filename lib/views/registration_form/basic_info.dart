import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/custom_appbar.dart';
import '../../components/widgets/custom_button.dart';
import '../../components/widgets/custom_radio_button.dart';
import '../../components/widgets/custom_text_form_fileld.dart';
import '../../components/enums.dart';
import '../../components/widgets/empty_image_avatar.dart';
import '../../components/widgets/filled_image_avatar.dart';
import '../../constants/colors.dart';
import '../../constants/paddings.dart';
import '../../view_model/registration_view_model/registration_view_model.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationViewModel rgViewModel = context.watch<RegistrationViewModel>();

    return Scaffold(
      appBar: customAppBar(title: "Register"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(PAGE_PADDING),
            child: Form(
              key: rgViewModel.basicInfoFormKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => rgViewModel.picImage(context),

                    // Show EmptyImageAvatar if image is not picked
                    child: rgViewModel.pickedImage == null
                        ? const EmptyImageAvatar()
                        : FilledImageAvatar(
                            image: rgViewModel.pickedImage!,
                          ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.firstNameController,
                    keyboardType: TextInputType.name,
                    validator: (fname) => rgViewModel.validFirstName(fname),
                    labelText: "First Name*",
                    hintText: "Enter your first name here",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    keyboardType: TextInputType.name,
                    controller: rgViewModel.lastNameController,
                    validator: (lname) => rgViewModel.validLastName(lname),
                    labelText: "Last Name*",
                    hintText: "Enter your last name here",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.phoneNoController,
                    validator: (phone) => rgViewModel.validPhoneNo(phone),
                    keyboardType: TextInputType.phone,
                    labelText: "Phone Number*",
                    hintText: "Enter your 10 digit phone number",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    keyboardType: TextInputType.emailAddress,
                    controller: rgViewModel.emailController,
                    validator: (email) => rgViewModel.validEmail(email),
                    labelText: "Email*",
                    hintText: "Your email goes here",
                    prefixIcon: const Icon(
                      Icons.email_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            CustomRadioButton(
                              title: "Male",
                              groupValue: rgViewModel.genderType,
                              value: Gender.male,
                              onChanged: (gen) =>
                                  rgViewModel.checkGender(gen as Gender),
                            ),
                            CustomRadioButton(
                              title: "Female",
                              groupValue: rgViewModel.genderType,
                              value: Gender.female,
                              onChanged: (gen) =>
                                  rgViewModel.checkGender(gen as Gender),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomTextformField(
                    // keyboardType: TextInputType.visiblePassword,
                    labelText: "Password*",
                    hintText: "Password",
                    obscureText: rgViewModel.isObscure,
                    controller: rgViewModel.passwordController,
                    validator: (value) {
                      return rgViewModel.validpassword(value);
                    },
                    suffixIcon: InkWell(
                      onTap: rgViewModel.toggleObscure,
                      child: rgViewModel.isObscure
                          ? const Icon(
                              Icons.visibility_off,
                              color: DARK_BLUE_COLOR,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: DARK_BLUE_COLOR,
                            ),
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.confirmPasswordController,
                    validator: (cpass) =>
                        rgViewModel.validConfirmPassword(cpass),
                    labelText: "Confirm Password*",
                    hintText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        // navigation: () => controller.checkNextButton,
                        navigation: rgViewModel.nextButton,
                        text: "Next   ",
                        textColor: Colors.white,
                        border: Border.all(
                          color: DARK_BLUE_COLOR,
                        ),
                        backgroundColor: DARK_BLUE_COLOR,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
