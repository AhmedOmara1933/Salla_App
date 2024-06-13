import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/styles/colors.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const DefaultButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusDirectional.circular(15.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          color: baseColor,
          padding: EdgeInsets.symmetric(
            vertical: 16.0
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
