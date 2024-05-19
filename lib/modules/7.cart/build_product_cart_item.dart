import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/12.get_cart_model.dart';
import '../../shared/components/build_button_cart_item.dart';
import '../../shared/cubit/shop_cubit.dart';
import '../../shared/cubit/shop_state.dart';

class BuildProductCartItem extends StatelessWidget {
  final CartItems cartItems;

  const BuildProductCartItem({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.black.withOpacity(0.2))),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 250.0,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 150.0,
                    padding: EdgeInsets.all(10.0),
                    height: 250.0,
                    // clipBehavior: Clip.antiAliasWithSaveLayer,
                    // decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black.withOpacity(0.2)),
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(10.0),
                    //       bottomLeft: Radius.circular(10.0),
                    //     )),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: '${cartItems.product!.image}',
                          progressIndicatorBuilder: (context, url, progress) =>
                              const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Center(child: const CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                  CartButton(
                    marginBottom: 10.0,
                    marginLeft: 10.0,
                    width: 150.0,
                      onPressed: () {},
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2))),
                            child: IconButton(
                                onPressed: () {},
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.delete_outline)),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.2))),
                            child: IconButton(
                                onPressed: () {}, icon: Icon(Icons.add)),
                          ),
                        ],
                      ))
                ],
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
                        '${cartItems.product!.name}',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '${cartItems.product!.description}',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 12.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                Text(
                                  '${cartItems.product!.price}',
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '00',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                // InkWell(
                                //   onTap: () {
                                //     cubit.changeFavoritesData(
                                //         productId: cartItems.product!.id!);
                                //   },
                                //   child: CircleAvatar(
                                //       backgroundColor:
                                //           cubit.favorites[cartItems.product!.id]!
                                //               ? Colors.red
                                //               : Colors.grey[300],
                                //       radius: 17.0,
                                //       child: Icon(
                                //         Icons.favorite,
                                //         size: 23.0,
                                //         color: Colors.white,
                                //       )),
                                // ),
                              ],
                            ),
                            if (cartItems.product!.discount != 0)
                              Text(
                                'EGP${cartItems.product!.oldPrice}.00',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          CartButton(
                            onPressed: () {
                              cubit.changeCartData(
                                  productId: cartItems.product!.id!);
                            },
                            widget: Text(
                              'Delete',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: CartButton(
                              onPressed: () {
                                print('Save Later');
                              },
                              widget: Text(
                                'Save Later',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
