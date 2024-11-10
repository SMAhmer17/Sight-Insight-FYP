import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/service/validator/validator_service.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/signup_screen.dart';

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

  late GlobalKey<FormState> _formKey;

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

         _formKey = GlobalKey<FormState>();
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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: GestureDetector(
             behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
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
                10.height,
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        .02.sh.height,
                        LabelAndTextField(
                            label: 'Your Name',
                            customTextField:
                                CustomTextField(descriptor: nameDescriptor , validator: Validators.mandatoryFieldValidation, nextFocusNode:  genderDescriptor.focusNode,)),
                                10.height,
                        LabelAndTextField(
                            label: 'Gender',
                            customTextField:
                                CustomTextField(descriptor: genderDescriptor, validator: Validators.mandatoryFieldValidation, nextFocusNode:  ageDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Age',
                            customTextField:
                                CustomTextField(descriptor: ageDescriptor, validator: Validators.mandatoryFieldValidation, nextFocusNode:  eyeDiseaseDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Any eye disease before',
                            customTextField:
                                CustomTextField(descriptor: eyeDiseaseDescriptor, validator: Validators.mandatoryFieldValidation, nextFocusNode:  phoneNumberDescriptor.focusNode)),
                       10.height,
                        LabelAndTextField(
                            label: 'Country',
                            customTextField:
                                CustomTextField(descriptor: countryDescriptor, validator: Validators.mandatoryFieldValidation,  nextFocusNode:  cityDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'City',
                            customTextField:
                                CustomTextField(descriptor: cityDescriptor, validator: Validators.mandatoryFieldValidation, nextFocusNode:  phoneNumberDescriptor.focusNode)),
                    
                        10.height,
                        LabelAndTextField(
                            label: 'Phone number',
                            customTextField:
                                CustomTextField(descriptor: phoneNumberDescriptor, validator: Validators.mandatoryFieldValidation)),
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
            
                            if(_formKey.currentState!.validate()){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUpScreen() ));
                  
                            }
                              
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
