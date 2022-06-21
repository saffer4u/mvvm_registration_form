import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/custom_appbar.dart';
import '../../components/widgets/custom_button.dart';
import '../../components/widgets/custom_dropdown_textfield.dart';
import '../../components/widgets/custom_text_form_fileld.dart';
import '../../constants/colors.dart';
import '../../constants/paddings.dart';
import '../../view_model/registration_view_model/registration_view_model.dart';

class EducationalInfo extends StatelessWidget {
  const EducationalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationViewModel rgViewModel = context.watch<RegistrationViewModel>();
    return Scaffold(
      appBar: customAppBar(title: "Your Info"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PAGE_PADDING),
            child: Form(
              key: rgViewModel.educationalFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Educational Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  CustomDropdownTextFormField(
                    hintText: "Select Your Qualification",
                    titleText: "Education*",
                    dropDownListOfItems:
                        rgViewModel.getListOfQualificationString(),
                    onChanged: rgViewModel.qualificationOnChange,
                    isEmpty:
                        rgViewModel.intialSelectedCourse == null ? true : false,
                    value: rgViewModel
                        .educationMap[rgViewModel.intialSelectedCourse],
                  ),
                  CustomDropdownTextFormField(
                    hintText: "Enter Year of Passing",
                    titleText: "Year of Passing*",
                    dropDownListOfItems: rgViewModel.yearList,
                    onChanged: rgViewModel.yearListOnChange,
                    isEmpty:
                        rgViewModel.intialSelectedYear.isEmpty ? true : false,
                    value: rgViewModel.intialSelectedYear.isEmpty
                        ? null
                        : rgViewModel.intialSelectedYear,
                  ),
                  CustomTextformField(
                    labelText: "Grade*",
                    controller: rgViewModel.gradeController,
                    validator: (grd) => rgViewModel.validGrade(grd),
                    hintText: "Enter Your Grade of Percentage",
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(
                      color: BLACK_COLOR.withOpacity(0.12),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Professional Info",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.experienceController,
                    validator: (exp) => rgViewModel.validExperience(exp),
                    keyboardType: TextInputType.number,
                    labelText: "Experience*",
                    hintText: "Enter Year of Experience",
                  ),
                  CustomDropdownTextFormField(
                    hintText: "Select Designation",
                    titleText: "Designatoin*",
                    dropDownListOfItems: rgViewModel.designationlist,
                    onChanged: rgViewModel.designationOnChange,
                    isEmpty: rgViewModel.intialSelectedDesignation.isEmpty
                        ? true
                        : false,
                    value: rgViewModel.intialSelectedDesignation.isEmpty
                        ? null
                        : rgViewModel.intialSelectedDesignation,
                  ),
                  CustomDropdownTextFormField(
                    hintText: "Select Your Domain",
                    titleText: "Domain*",
                    dropDownListOfItems: rgViewModel.domainList,
                    onChanged: rgViewModel.domainOnChange,
                    isEmpty:
                        rgViewModel.intialSelectedDomain.isEmpty ? true : false,
                    value: rgViewModel.intialSelectedDomain.isEmpty
                        ? null
                        : rgViewModel.intialSelectedDomain,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton(
                        navigation: () => Navigator.of(context).pop(),
                        text: "Previous",
                        textColor: DARK_BLUE_COLOR,
                        backgroundColor: Colors.white,
                        border: Border.all(color: DARK_BLUE_COLOR),
                      )),
                      Expanded(
                          child: CustomButton(
                        navigation: () =>
                            rgViewModel.nextButtonEducational(context),
                        text: "Next",
                        textColor: Colors.white,
                        backgroundColor: DARK_BLUE_COLOR,
                        border: Border.all(color: DARK_BLUE_COLOR),
                      ))
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
