import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/modules/4.products/products_details.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/function/function.dart';
import '../../models/3.home_model.dart';

// ignore: must_be_immutable
class BuildGridProduct extends StatelessWidget {
  Products products;

  BuildGridProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ShopSuccessChangeFavoritesDataState) {
          if (state.changeFavoritesModel.status!) {
            flutterToast(msg: state.changeFavoritesModel.message!);
          } else {
            flutterToast(msg: state.changeFavoritesModel.message!);
          }
        }
        if (state is ShopSuccessChangeCartDataState) {
          if (state.changeCartModel.status!) {
            flutterToast(msg: state.changeCartModel.message!);
          } else {
            flutterToast(msg: state.changeCartModel.message!);
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return GestureDetector(
          onTap: () {
            navigateTo(context, ProductsDetails(products: products), false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey[300],
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  height: 320.0,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 10.0, left: 10.0, right: 10.0),
                            height: 200,
                            width: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: '${products.image}',
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
                          if (products.discount != 0)
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  )),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 7.0),
                              child: Text(
                                'discount'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0.sp),
                              ),
                            ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${products.name}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14.0.sp,
                                    height: 1.3,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${products.price.round()}\$',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0.sp,
                                            color: Colors.blue),
                                      ),
                                      SizedBox(
                                        width: 5.0.w,
                                      ),
                                      if (products.discount != 0)
                                        Text(
                                          '${products.oldPrice.round()}\$',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 13.0.sp,
                                              color: Colors.grey[700],
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cubit.changeFavoritesData(
                                          productId: products.id!);
                                    },
                                    child: CircleAvatar(
                                        backgroundColor:
                                            cubit.favorites[products.id]!
                                                ? Colors.red
                                                : Colors.grey[300],
                                        radius: 17.0,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 23.0,
                                          color: Colors.white,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 293.0,
                  left: 0.0,
                  right: 0.0,
                  height: 50.0,
                  child: InkWell(
                    onTap: () {
                      cubit.changeCartData(productId: products.id!);
                    },
                    child: CircleAvatar(
                        backgroundColor: Color(0xff4a9f51),
                        child: Icon(
                          cubit.carts[products.id]!?Icons.shopping_cart:Icons.remove_shopping_cart,
                          size: 30.0,
                          color: Colors.white,
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
