import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget widget;
  final double? width;
  final double marginBottom;
  final double marginLeft;
   CartButton({
     super.key,
     required this.onPressed,
     required this.widget,
     this.width,
     this.marginBottom=0.0,
     this.marginLeft=0.0,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom, left: marginLeft),
      height: 40.0,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.black.withOpacity(0.2))),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        color: Colors.white,
        onPressed: onPressed,
        child:widget
      ),
    );
  }
}
