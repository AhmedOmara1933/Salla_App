import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final String? hintText;
  final String?labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final void Function()? suffixOnPressed;
  final bool obscureText;
  final Color? iconColor;
  final Color? focusedBorder;
  final Color? enabledBorder;
  final Color? textColor;
  final double margin;
  final bool contentPadding;
  final double? iconSize;
  final double? textFontSize;
  final double outlineInputBorder;

  const DefaultTextFormField(
      {super.key,
      this.controller,
      this.onFieldSubmitted,
      this.obscureText = false,
      this.validate,
      this.onChanged,
      this.keyboardType,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixOnPressed,
      this.iconColor,
      this.textColor,
      this.margin = 20.0,
      this.contentPadding = false,
      this.focusedBorder = Colors.black,
      this.enabledBorder = Colors.black,
      this.iconSize,
      this.outlineInputBorder = 10.0,
      this.textFontSize,
        this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          keyboardType: keyboardType,
          validator: validate,
          decoration: InputDecoration(
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.white),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.white),
            // ),
            contentPadding: contentPadding == true
                ? const EdgeInsets.symmetric(horizontal: 20.0)
                : null,
            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(color: textColor, fontSize: textFontSize),
            prefixIcon: Icon(
              prefixIcon,
              color: iconColor,
              size: iconSize,
            ),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: suffixOnPressed,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(outlineInputBorder),
            ),
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(outlineInputBorder),
                borderSide: BorderSide(
                color: Colors.black.withOpacity(0.3)
              )
            ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(outlineInputBorder),
                borderSide: BorderSide(
                color: baseColor
              )
            )
          ),
        ),
      ),
    );
  }
}
