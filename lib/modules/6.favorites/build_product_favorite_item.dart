import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/10.get_favorite_model.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';

class BuildProductFavoriteItem extends StatelessWidget {
  final FavoritesData favoritesData;

  const BuildProductFavoriteItem({super.key, required this.favoritesData});

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
                  imageUrl: '${favoritesData.product!.image}',
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
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${favoritesData.product!.name}',
                        style: TextStyle(
                            height: 1.3,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  '${favoritesData.product!.price}',
                                  style: TextStyle(
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '00',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            InkWell(
                              onTap: () {
                                cubit.changeFavoritesData(
                                    productId: favoritesData.product!.id!);
                              },
                              child: CircleAvatar(
                                  backgroundColor: cubit
                                          .favorites[favoritesData.product!.id]!
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
                      ),
                      if (favoritesData.product!.discount != 0)
                        Text(
                          'EGP${favoritesData.product!.oldPrice}.00',
                          style:
                              TextStyle(decoration: TextDecoration.lineThrough),
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
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
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
