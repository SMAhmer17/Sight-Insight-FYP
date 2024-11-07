import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/service/widgets.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_divider.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/forget_password_screen.dart';
import 'package:eyeinsider/views/auth/signup_screen.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDetailScreen extends StatefulWidget {
  static const id = 'loginScreen';
  static dynamic route =
      MaterialPageRoute(builder: (context) => const UserDetailScreen());
  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late InputDescriptor nameDescriptor;
  late InputDescriptor genderDescriptor;
  late InputDescriptor ageDescriptor;
  late InputDescriptor eyeDiseaseDescriptor;
  late InputDescriptor phoneNumberDescriptor;
  late InputDescriptor countryDescriptor;
  late InputDescriptor cityDescriptor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
         SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        
      statusBarColor: ColorConstant.secondary,
        systemNavigationBarColor: ColorConstant.scaffoldBackgroundColor,
        
      ),
    );

    nameDescriptor = InputDescriptor(hintText: 'Enter your name...');
    genderDescriptor = InputDescriptor(hintText: 'Enter your gender...');
    ageDescriptor = InputDescriptor(hintText: 'Enter your age...');
    eyeDiseaseDescriptor =
        InputDescriptor(hintText: 'Eye disease before -- Yes/No');
    phoneNumberDescriptor =
        InputDescriptor(hintText: 'Enter your phone number...');
    countryDescriptor =
        InputDescriptor(hintText: 'Enter your country name here...');
    cityDescriptor = InputDescriptor(hintText: 'Enter your city name here...');
 


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: .3.sh,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.authBg,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        bottom: 50,
                        left: 20,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your Profile',
                              style: context.headlineLarge
                                  ?.copyWith(color: ColorConstant.primary),
                            ),
                            10.height,
                            Text(
                              'Fill in your details for a customized journey',
                              textAlign: TextAlign.center,
                              style: context.bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    .04.sh.height,
                    LabelAndTextField(
                        label: 'Your Name',
                        customTextField:
                            CustomTextField(descriptor: nameDescriptor)),
                            10.height,
                    LabelAndTextField(
                        label: 'Gender',
                        customTextField:
                            CustomTextField(descriptor: genderDescriptor)),
                    10.height,
                    LabelAndTextField(
                        label: 'Age',
                        customTextField:
                            CustomTextField(descriptor: ageDescriptor)),
                    10.height,
                    LabelAndTextField(
                        label: 'Any eye disease before',
                        customTextField:
                            CustomTextField(descriptor: eyeDiseaseDescriptor)),
                    10.height,
                    LabelAndTextField(
                        label: 'Phone number',
                        customTextField:
                            CustomTextField(descriptor: phoneNumberDescriptor)),
                   10.height,
                    LabelAndTextField(
                        label: 'Country',
                        customTextField:
                            CustomTextField(descriptor: countryDescriptor)),
                    10.height,
                    LabelAndTextField(
                        label: 'City',
                        customTextField:
                            CustomTextField(descriptor: cityDescriptor)),
                    10.height,
                    CustomElevatedButton(
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Save',
                            style: context.titleMedium
                                ?.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                      onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen() ));

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
