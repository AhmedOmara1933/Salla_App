import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../models/12.get_cart_model.dart';
import '../../shared/function/function.dart';
import 'build_product_cart_item.dart';

class CartScreen extends StatelessWidget {
  final CartItems ?cartItems;
   CartScreen({super.key, this.cartItems});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
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
        bool isCartEmpty = cubit.getCartModel == null ||
            cubit.getCartModel!.data == null ||
        cubit.getCartModel!.data!.cartItems!.isEmpty;
        ;
        return Column(
          children: [
            ConditionalBuilder(
              condition: !isCartEmpty,
              builder: (context) => Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => BuildProductCartItem(
                        cartItems: cubit.getCartModel!.data!.cartItems![index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10.0,
                        ),
                    itemCount: cubit.getCartModel!.data!.cartItems!.length),
              ),
              fallback: (context) => Padding(
                padding: const EdgeInsets.symmetric(vertical:50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/cart_empty.png'),
                    ),
                    Text(
                      'No Cart Item',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                    )
                  ],
                ),
              ),
            ),
            if(!isCartEmpty)
            Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  double totalPrice = cubit.getTotalPrice();
                  showTotalPriceBottomSheet(context, totalPrice);
                },
                child: Text('Show Total Price'),
              ),
            ),

          ],
        );
      },
    );
  }
  void showTotalPriceBottomSheet(BuildContext context, double totalPrice) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical:10.0),
                child: Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'EGP ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20.0),
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10.0),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal:40.0,vertical: 10.0),
                  color: baseColor,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
