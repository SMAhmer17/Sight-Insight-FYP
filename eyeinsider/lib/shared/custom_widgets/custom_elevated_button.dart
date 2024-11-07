
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/constants/utils.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget widget;
 final Color? bgColor;
  final  void Function() onPressed; 
  const CustomElevatedButton({
    super.key, required this.widget, required this.onPressed,  this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
         minimumSize: const Size.fromHeight(44),
        backgroundColor: bgColor ?? ColorConstant.primary,
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            textStyle: const TextStyle(
              fontFamily: Utils.kInterFontFamily,
              color:  ColorConstant.secondary,
              fontWeight: FontWeight.w700,
              fontSize: 20,
      )),
      
       onPressed: onPressed, child: widget);
  }
}

