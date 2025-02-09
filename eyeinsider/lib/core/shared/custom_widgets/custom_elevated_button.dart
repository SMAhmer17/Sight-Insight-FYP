import 'package:eyeinsider/constants/assets_path/icon_constant.dart';
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/constants/utils.dart';
import 'package:eyeinsider/core/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? bgColor;
  final String? prefixIconPath;
  final bool loading;
  final String title;
  final void Function() onPressed;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.bgColor,
    this.loading = false,
    required this.title,
    this.prefixIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
          backgroundColor: bgColor ?? ColorConstant.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: const TextStyle(
            fontFamily: Utils.kInterFontFamily,
            color: ColorConstant.secondary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          )),
      onPressed: onPressed,
      child: loading == true
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: const CircularProgressIndicator.adaptive(
                strokeCap: StrokeCap.round,
                backgroundColor: Colors.white,
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (prefixIconPath != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 2),
                    child: SvgPicture.asset(
                      prefixIconPath!,
                      height: 24,
                      width: 24,
                    ),
                  ),
                Text(
                  title,
                  style: context.titleMedium?.copyWith(color: Colors.white),
                )
              ],
            ),
    );
  }
}
