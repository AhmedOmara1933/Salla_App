import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/4.category_model.dart';

// ignore: must_be_immutable
class BuildListCategory extends StatelessWidget {
  DataModel model;

  BuildListCategory({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white),
          padding: EdgeInsets.all(5.0),
          height: 150.0,
          width: 150.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: double.infinity,
            imageUrl: '${model.image}',
            progressIndicatorBuilder: (context, url, progress) =>
            const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            ),
            errorWidget: (context, url, error) =>
                Center(child: const CircularProgressIndicator()),
          ),
        ),
        Text(
          '${model.name}'.toUpperCase(),
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              height: 2.0),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
