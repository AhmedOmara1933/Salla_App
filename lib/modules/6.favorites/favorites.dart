import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/6.favorites/build_product_favorite_item.dart';
import '../../shared/cubit/shop_cubit.dart';
import '../../shared/cubit/shop_state.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return ConditionalBuilder(
            //condition:cubit.getFavoritesModel!=null,
            condition: state is! ShopLoadingGetFavoritesDataState,
            builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BuildProductFavoriteItem(
                      favoritesData:
                          cubit.getFavoritesModel!.data!.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10.0,
                  ),
                  itemCount: cubit.getFavoritesModel!.data!.data!.length,
                ),
            fallback: (context) => Center(
              child: Text(
                'Your Favorites is Empty',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black
              ),
              ),
            ));
      },
    );
  }
}
