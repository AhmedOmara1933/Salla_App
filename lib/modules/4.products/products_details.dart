import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../models/3.home_model.dart';
import '../../models/4.category_model.dart';

// ignore: must_be_immutable
class ProductsDetails extends StatelessWidget {
  Products products;

  ProductsDetails({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Product Details',
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.black
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: 260.0,
              ),
              Container(
                height: 170.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                    ),
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.black.withOpacity(0.1))),
              ),
              Positioned(
                  top: 55.0,
                  bottom: 0,
                  left: 100.0,
                  right: 100.0,
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          border:
                              Border.all(color: Colors.black.withOpacity(0.1))),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        //fit: BoxFit.cover,
                        imageUrl: '${products.image}',
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            Center(child: const CircularProgressIndicator()),
                      ))),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${products.name}',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Description',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 120.0,
                    child: Scrollbar(
                      trackVisibility: false,
                      child:
                          ListView(physics: BouncingScrollPhysics(), children: [
                        ReadMoreText(
                          '${products.description}',
                          trimLines: 5,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: 'Show less',
                          moreStyle: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                          lessStyle: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )
                      ]),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 150.0,
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.all(7.0),
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1))),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: '${products.images![index]}',
                              progressIndicatorBuilder:
                                  (context, url, progress) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                  child: const CircularProgressIndicator()),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                      itemCount: products.images!.length),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//todo//how can limited the height in show more and the images of product
