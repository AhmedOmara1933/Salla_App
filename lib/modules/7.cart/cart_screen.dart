import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';

import 'build_product_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=ShopCubit.get(context);
        return ConditionalBuilder(
          condition:state is! ShopLoadingGetCartDataState,
          builder: (context) =>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>BuildProductCartItem(cartItems: cubit.getCartModel!.data!.cartItems![index]) ,
            separatorBuilder: (context, index) => SizedBox(
              height: 10.0,
            ),
            itemCount: cubit.getCartModel!.data!.cartItems!.length
          ),
          fallback: (context) => CircularProgressIndicator(),
        );
      },
    );
  }
}
