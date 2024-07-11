import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  var controller = TextEditingController();
  String hintText;
  String labelText;
  bool isPassword;
  TextInputType keyboardType;
  Widget? suffix;
  Widget? prefix;
  int? maxLines;
  String? Function(String?)? validator;
  Function(String?)? onChang;
  Function()? onTap;
  Function(PointerDownEvent)? onTapOutside;
  Color backgroundColor;
  Color borderSideColor;

  FocusNode? foucusNode;

  CustomFormField({
    super.key,
    required this.controller,
    this.hintText = 'what do you search for?',
    this.labelText = '',
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.prefix,
    this.foucusNode,
    this.maxLines = 1,
    this.validator,
    this.onChang,
    this.onTap,
    this.backgroundColor = const Color(0xffFFFFFF),
    this.borderSideColor = Colors.black,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      validator: validator,
      maxLines: maxLines,
      onChanged: onChang,
      focusNode: foucusNode,
      controller: controller,
      onTap: onTap,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: true,
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        fillColor: backgroundColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
        suffixIcon: suffix,
        prefixIcon: prefix,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: borderSideColor, width: 2),
        ),
      ),
    );
  }
}
