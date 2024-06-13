import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../shared/function/function.dart';
import '../8.search/search.dart';
import 'products_builder.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

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
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => ProductsBuilder(model: cubit.homeModel!),
          fallback: (context) => Center(
              child: CircularProgressIndicator(
            color: baseColor,
          )),
        );
      },
    );
  }
}

//ListView.separated(
//             itemBuilder: (context, index) => Bannners(model:cubit.homeModel!.data!.banners![index]),
//             separatorBuilder: (context, index) => SizedBox(
//               height: 20.0,
//             ),
//             itemCount: cubit.homeModel!.data!.banners!.length
//         );
