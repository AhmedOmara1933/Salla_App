import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../models/3.home_model.dart';
import '../../models/8.search_model.dart';
import '../4.products/products_details.dart';

// ignore: must_be_immutable
class BuildProductSearchItem extends StatelessWidget {
final SubData ?subData;
 final Products ?products;



BuildProductSearchItem({super.key,this.subData,  this.products, });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        navigateTo(context, ProductsDetails(products: products!), true);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.black.withOpacity(0.2))),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 200.0,
        child: Row(
          children: [
            Container(
              height: 200.0,
              width: 150.0,
              padding: EdgeInsets.all(10.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  )),
              child: CachedNetworkImage(
                imageUrl: '${subData!.image}',
                progressIndicatorBuilder: (context, url, progress) =>
                 Center(
                  child: CircularProgressIndicator(
                    color: baseColor,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: const CircularProgressIndicator()),
              ),
            ),
            Expanded(
              child: Container(
                margin:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${subData!.name}',
                      style: TextStyle(
                          height: 1.3,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                'EGP',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                '${subData!.price!.round()}',
                                style: TextStyle(
                                    fontSize: 28.0,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                '00',
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          SizedBox(width: 5.0,),
                          // if(subData.discount!=0)
                          // Expanded(
                          //   child: Text(
                          //     'EGP${subData.oldPrice}.00',
                          //     style: TextStyle(
                          //         decoration: TextDecoration.lineThrough
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        color: Colors.yellow[600],
                        onPressed: () {},
                        child: Text('Add To Cart',style: TextStyle(

                            fontWeight: FontWeight.w500
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
