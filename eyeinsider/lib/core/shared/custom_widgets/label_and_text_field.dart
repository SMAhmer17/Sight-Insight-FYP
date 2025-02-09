
import 'package:eyeinsider/constants/color_constant.dart';
import 'package:eyeinsider/core/extensions/widgets_extension.dart';
import 'package:eyeinsider/core/shared/custom_widgets/custom_text_field.dart';
import 'package:eyeinsider/core/theme/custom_text_style_theme.dart';
import 'package:flutter/material.dart';

class LabelAndTextField extends StatelessWidget {
  
  final String label;
  final  customTextField;
  const LabelAndTextField({
    super.key,required this.label, required this.customTextField,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
    
                Text(label , textAlign: TextAlign.center, style: context.bodyMedium?.copyWith( fontWeight: FontWeight.w800, color: ColorConstant.lightGrey),),
            10.height,
          customTextField
     ],
    );
  }
}
