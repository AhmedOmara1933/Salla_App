import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/4.category_model.dart';
import 'package:shop_app/shared/function/function.dart';

class CategoriesBuilder extends StatelessWidget {
  DataModel model;

  CategoriesBuilder({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[400]),
      height: 170.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white),
                  padding: EdgeInsets.all(5.0),
                  height: 140.0,
                  width: 140.0,
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
                Expanded(
                  child: Text(
                    '${model.name}'.toUpperCase(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined))
        ],
      ),
    );
  }
}
