import 'package:eyeinsider/constants/assets_path/icon_constant.dart';
import 'package:eyeinsider/constants/assets_path/image_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/providers/auth_provider.dart';
import 'package:eyeinsider/core/extensions/widgets_extension.dart';
import 'package:eyeinsider/service/validator/validator_service.dart';
import 'package:eyeinsider/core/shared/custom_widgets/custom_divider.dart';
import 'package:eyeinsider/core/shared/custom_widgets/custom_elevated_button.dart';
import 'package:eyeinsider/core/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/core/shared/custom_widgets/input_descriptor.dart';
import 'package:eyeinsider/core/shared/custom_widgets/label_and_text_field.dart';
import 'package:eyeinsider/core/theme/custom_text_style_theme.dart';
import 'package:eyeinsider/views/auth/forget_password_screen.dart';
import 'package:eyeinsider/views/auth/signup_screen.dart';
import 'package:eyeinsider/views/navigator_screens/base_navigator/base_navigator_screen.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'loginScreen';
  static dynamic route =
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late InputDescriptor emailDescriptor;
  late InputDescriptor passwordDescriptor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    const SystemUiOverlayStyle(
      statusBarColor: ColorConstant.whiteColor,
      systemNavigationBarColor: ColorConstant.whiteColor,
    );

    emailDescriptor = InputDescriptor(hintText: 'Enter your email address...');
    passwordDescriptor = InputDescriptor(hintText: 'Enter your password...');
  }

  bool isObsecured = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: ColorConstant.authScreenSystemStatusBar,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: ColorConstant.scaffoldBackgroundColor),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
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
                                  'Sign In',
                                  style: context.headlineLarge
                                      ?.copyWith(color: ColorConstant.primary),
                                ),
                                10.height,
                                Text(
                                  'Log in to access your personalized Medinest experience',
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
                            label: 'Email',
                            customTextField: CustomTextField(
                              descriptor: emailDescriptor,
                              validator: Validators.emailValidation,
                            )),
                        LabelAndTextField(
                            label: 'Password',
                            customTextField: CustomTextField(
                                descriptor: passwordDescriptor,
                                obscureText: isObsecured,
                                validator: Validators.mandatoryFieldValidation,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObsecured = !isObsecured;
                                      });
                                    },
                                    icon: isObsecured
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)))),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgetPassword()));
                              },
                              child: Text(
                                'Forgot password?',
                                style: context.bodyMedium
                                    ?.copyWith(color: ColorConstant.primary),
                              ),
                            ),
                          ],
                        ),
                        .04.sh.height,
                        Consumer<AuthProvider2>(builder: (context, prov, _) {
                          return CustomElevatedButton(
                            title: 'Sign in',
                            loading: prov.loading,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                prov.loginWithEmailPass(
                                    email:
                                        emailDescriptor.controller.text.trim(),
                                    password: passwordDescriptor.controller.text
                                        .trim());
                              }
                            },
                          );
                        }),
                        CustomDivider(
                          showOrText: true,
                          bottomPadding: .03.sh,
                          topPadding: .03.sh,
                        ),
                        CustomElevatedButton(
                          prefixIconPath: IconConstant.google,
                          bgColor: Colors.black87,
                          title: 'Continue with google',
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  30.height,
                  Padding(
                    padding: EdgeInsets.only(bottom: 25.h),
                    child: Column(
                      children: [
                        Center(
                          child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: "Don't have an account? ",
                                  style: context.bodyLarge?.copyWith(
                                      color: ColorConstant.lightGrey),
                                  children: [
                                    TextSpan(
                                      text: 'Sign up',
                                      style: context.bodyLarge?.copyWith(
                                        color: ColorConstant.lightGrey,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context, SignUpScreen.route);
                                        },
                                    )
                                  ])),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
