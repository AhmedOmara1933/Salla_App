import 'package:flutter/material.dart';
import 'package:shop_app/models/5.settings_model.dart';

// ignore: must_be_immutable
class TermsScreen extends StatelessWidget {
 final Data data;

  const TermsScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Terms',
            style: TextStyle(color: Colors.black, fontSize: 35.0),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('${data.terms}',
                  style: TextStyle(
                  fontSize: 25.0,
                    height: 1.5
              ),),
            ),
          ),
        ));
  }
}
