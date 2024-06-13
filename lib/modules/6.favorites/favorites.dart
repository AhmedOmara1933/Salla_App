import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/6.favorites/build_product_favorite_item.dart';
import 'package:shop_app/shared/components/default_button.dart';
import '../../shared/cubit/shop_cubit.dart';
import '../../shared/cubit/shop_state.dart';
import '../../shared/function/function.dart';
import '../4.products/products_screen.dart';
import '../8.search/search.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ShopSuccessChangeFavoritesDataState) {
          if (state.changeFavoritesModel.status!) {
            print(state.changeFavoritesModel.message);
            flutterToast(msg: state.changeFavoritesModel.message!);
          } else {
            print(state.changeFavoritesModel.message);
            flutterToast(msg: state.changeFavoritesModel.message!);
          }
        }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        // دي عشان يظهر الصوره في حاله لو favorite فاضيه
        bool isFavoritesEmpty = cubit.getFavoritesModel == null ||
            cubit.getFavoritesModel!.data == null ||
            cubit.getFavoritesModel!.data!.data == null ||
            cubit.getFavoritesModel!.data!.data!.isEmpty;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('images/salla.eg-removebg-preview.png'),
                  width: 150.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            titleSpacing: 0.0,
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen(), false);
                },
              ),
            ],
          ),
          body: ConditionalBuilder(
              condition: !isFavoritesEmpty,
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
              fallback: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('images/favorite_empty.png'),
                      ),
                      // DefaultButton(
                      //   text: 'Go to add more items',
                      //   onPressed: () {
                      //     navigateTo(context, ProductsScreen(), true);
                      //   },
                      // )
                    ],
                  )),
        );
      },
    );
  }
}
