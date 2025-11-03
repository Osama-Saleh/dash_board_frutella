import 'package:dash_board/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  // final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final Function(String?)? onSaved;

  const CustomTextFormFiled({
    super.key,
    // required this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
    this.prefixIcon,
    this.onSaved,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      // validator: validator,
      validator: (value){
        if(value == null || value.isEmpty){
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: keyboardType,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(color: Color(0xff949D9E)),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0xffF9FAFA),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xffE6E9EA)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
