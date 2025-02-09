
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  CustomBottomNavBar({
    super.key,
    // required this.currentTabIndex,
     required this.initialTabIndex,
  });

  // int currentTabIndex;
   final int initialTabIndex;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

    late int currentTabIndex;

    @override
  void initState() {
    super.initState();
    currentTabIndex = widget.initialTabIndex; // Initialize state
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25.0), // Adjust the radius as needed
        topRight: Radius.circular(25.0),
      ),
      child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentTabIndex,
          onTap: (index) {
            setState(() {
              // widget.currentTabIndex = index;
              currentTabIndex = index; // Update state
            });
          },
          backgroundColor: ColorConstant.bottomNavbar,
          unselectedItemColor: Colors.white,
          selectedItemColor: ColorConstant.primary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Upload'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Blogs'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
