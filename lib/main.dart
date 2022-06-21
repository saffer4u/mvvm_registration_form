import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/registration_view_model/registration_view_model.dart';
import 'views/registration_form/basic_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RegistrationViewModel>(
            create: (_) => RegistrationViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Registration Form',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // Initial Page
        home: const BasicInfo(),
      ),
    );
  }
}
