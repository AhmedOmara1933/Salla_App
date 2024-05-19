import 'package:flutter/material.dart';

import '../../models/3.home_model.dart';

class Bannners extends StatelessWidget {
  Banners model;
  Bannners({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: 200.0,
          width: 200.0,
          image: NetworkImage('${model.image}'),
        ),
      ],
    );
  }
}
