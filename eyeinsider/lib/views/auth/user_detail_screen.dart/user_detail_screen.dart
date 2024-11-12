import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/data/user_data/user_model.dart';
import 'package:eyeinsider/providers/user_detail_provider.dart';
import 'package:eyeinsider/service/extensions/widgets_extension.dart';
import 'package:eyeinsider/service/validator/validator_service.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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
                            customTextField: CustomTextField(
                              descriptor: nameDescriptor,
                              validator: Validators.mandatoryFieldValidation,
                              nextFocusNode: genderDescriptor.focusNode,
                            )),
                        10.height,
                        LabelAndTextField(
                            label: 'Gender',
                            customTextField: CustomTextField(
                                descriptor: genderDescriptor,
                                validator: Validators.mandatoryFieldValidation,
                                nextFocusNode: ageDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Age',
                            customTextField: CustomTextField(
                                descriptor: ageDescriptor,
                                validator: Validators.mandatoryFieldValidation,
                                nextFocusNode: eyeDiseaseDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Any eye disease before',
                            customTextField: CustomTextField(
                                descriptor: eyeDiseaseDescriptor,
                                validator: Validators.mandatoryFieldValidation,
                                nextFocusNode:
                                    phoneNumberDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Country',
                            customTextField: CustomTextField(
                                descriptor: countryDescriptor,
                                validator: Validators.mandatoryFieldValidation,
                                nextFocusNode: cityDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'City',
                            customTextField: CustomTextField(
                                descriptor: cityDescriptor,
                                validator: Validators.mandatoryFieldValidation,
                                nextFocusNode:
                                    phoneNumberDescriptor.focusNode)),
                        10.height,
                        LabelAndTextField(
                            label: 'Phone number',
                            customTextField: CustomTextField(
                                descriptor: phoneNumberDescriptor,
                                validator:
                                    Validators.mandatoryFieldValidation)),
                        10.height,

                        CustomElevatedButton(
                            onPressed: () {
                              // Storing data temporarily in the model
                              final userProv = Provider.of<UserDetailsProvider>(
                                  context,
                                  listen: false);
                              userProv.setTempUserData(UserModel(
                                name: nameDescriptor.controller.text,
                                gender: genderDescriptor.controller.text,
                                age: 22,
                                dob: DateTime.now(),
                                previousEyeDisease: false,
                                country: countryDescriptor.controller.text,
                                city: cityDescriptor.controller.text,
                                phoneNumber: 212321,
                                email: 'samer003@gmail.com',
                              ));
                              Navigator.of(context).push(_createRoute(nextScreen:  LoginScreen()));
                            },
                            title: 'Save')

                        // Consumer<UserDetailsProvider>(
                        //     builder: (context, userProv, _) {
                        //   return CustomElevatedButton(
                        //     title: 'Save',
                        //     loading: userProv.loading,
                        //     onPressed: () async {
                        //       if (_formKey.currentState!.validate()) {
                        //         await userProv.postUserDetails(
                        //             userModel: UserModel(
                        //                 name: nameDescriptor.controller.text,
                        //                 gender:
                        //                     genderDescriptor.controller.text,
                        //                 // age: int.tryParse(ageDescriptor.controller.text) ,
                        //                 age: 22,
                        //                 dob: DateTime.now(),
                        //                 previousEyeDisease: false,
                        //                 country:
                        //                     countryDescriptor.controller.text,
                        //                 city: cityDescriptor.controller.text,
                        //                 phoneNumber: 212321,
                        //                 email: 'samer003@gmail.com'),
                        //             uid: 'w');

                        //         await Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     const SignUpScreen()));
                        // }
                        // },
                        // );
                        // }),
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


Route _createRoute({required Widget nextScreen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>  nextScreen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve , ));

      return SlideTransition(
        
        position: animation.drive(tween),
        child: child,
  
      );
      
    },
     transitionDuration: const Duration(milliseconds: 800)
  );
  
}