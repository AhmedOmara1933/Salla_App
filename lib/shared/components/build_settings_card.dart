import 'package:flutter/material.dart';

class BuildSettingsCard extends StatelessWidget {
  final String text;
  final IconData prefixIcon;
  final void Function()? iconPressed;

  const BuildSettingsCard(
      {super.key,
      required this.text,
      required this.prefixIcon,
      this.iconPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(10.0),
      margin: EdgeInsetsDirectional.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadiusDirectional.circular(10.0)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                prefixIcon,
                size: 35.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '${text}',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              size: 25.0,
            ),
            onPressed: iconPressed,
          ),
        ],
      ),
    );
  }
}
