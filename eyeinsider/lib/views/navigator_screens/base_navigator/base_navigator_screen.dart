import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/core/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseNavigatorScreen extends StatefulWidget {
  const BaseNavigatorScreen({super.key});

  @override
  State<BaseNavigatorScreen> createState() => _BaseNavigatorScreenState();
}

class _BaseNavigatorScreenState extends State<BaseNavigatorScreen> {
  final List pages = ['Home', 'Camera', 'Blogs', 'Profile'];
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: ColorConstant.scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: ColorConstant.bottomNavbar,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        body: Center(
          child: Text(
            pages[currentTabIndex],
            style:
                context.headlineLarge?.copyWith(color: ColorConstant.primary),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25.0), // Adjust the radius as needed
            topRight: Radius.circular(25.0),
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentTabIndex,
              onTap: (index) {
                setState(() {
                  currentTabIndex = index;
                });
              },
              backgroundColor: ColorConstant.bottomNavbar,
              unselectedItemColor: Colors.white,
              selectedItemColor: ColorConstant.primary,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera), label: 'Upload'),
                BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Blogs'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
