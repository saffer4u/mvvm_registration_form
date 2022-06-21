import 'package:flutter/material.dart';
import '../../constants/colors.dart';
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
                    labelText: "Address*",
                    controller: rgViewModel.addressController,
                    validator: (adrs) => rgViewModel.validAddress(adrs),
                    hintText: "Address",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    labelText: "Landmark*",
                    controller: rgViewModel.landmarkController,
                    validator: (land) => rgViewModel.validLandmark(land),
                    hintText: "Landmark",
                    prefixIcon: const Icon(
                      Icons.location_city_rounded,
                      color: DARK_BLUE_COLOR,
                    ),
                  ),
                  CustomTextformField(
                    labelText: "City*",
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
                        rgViewModel.initialSelectedState.isEmpty ? true : false,
                    value: rgViewModel.initialSelectedState.isEmpty
                        ? null
                        : rgViewModel.initialSelectedState,
                  ),
                  CustomTextformField(
                    labelText: "Pin Code*",
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
                    textColor: WHITE_COLOR,
                    border: Border.all(color: DARK_BLUE_COLOR),
                    backgroundColor: DARK_BLUE_COLOR,
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
