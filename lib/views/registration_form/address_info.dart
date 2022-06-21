import 'package:flutter/material.dart';
import 'package:mvvm_registration_form/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../components/widgets/custom_appbar.dart';
import '../../components/widgets/custom_button.dart';
import '../../components/widgets/custom_dropdown_textfield.dart';
import '../../components/widgets/custom_text_form_fileld.dart';
import '../../view_model/registration_view_model/registration_view_model.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RegistrationViewModel rgViewModel = context.watch<RegistrationViewModel>();
    return Scaffold(
      appBar: customAppBar(title: "Your Address"),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: rgViewModel.addressFormKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Column(
                children: [
                  CustomTextformField(
                    controller: rgViewModel.addressController,
                    validator: (adrs) => rgViewModel.validAddress(adrs),
                    hintText: "Adress",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.landmarkController,
                    validator: (land) => rgViewModel.validLandmark(land),
                    hintText: "Landmark",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    controller: rgViewModel.cityController,
                    validator: (city) => rgViewModel.validCity(city),
                    hintText: "City",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomDropdownTextFormField(
                    hintText: "Select Your State",
                    titleText: "State*",
                    dropDownListOfItems: rgViewModel.stateList,
                    onChanged: rgViewModel.stateOnChnage,
                    isEmpty:
                        rgViewModel.intialSelectedState.isEmpty ? true : false,
                    value: rgViewModel.intialSelectedState.isEmpty
                        ? null
                        : rgViewModel.intialSelectedState,
                  ),
                  CustomTextformField(
                    keyboardType: TextInputType.number,
                    controller: rgViewModel.pincodeController,
                    validator: (zip) => rgViewModel.validPinCode(zip),
                    hintText: "Pin Code",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomButton(
                      navigation: () => rgViewModel.submitButton(context),
                      text: "Submit",
                      textColor: Colors.white,
                      border: Border.all(color: DARK_BLUE_COLOR),
                      backgroundColor: DARK_BLUE_COLOR)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
