import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/8.search/search.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/function/function.dart';

class ShopHomeLayout extends StatelessWidget {
  const ShopHomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              // title: Row(
              //   children: [
              //     // Text(
              //     //   'Salla.eg',
              //     //   style: TextStyle(color: Colors.black),
              //     // ),
              //     // Text(
              //     //   'Hi ${cubit.profileModel!.data!.name}',
              //     //   style: TextStyle(color: Colors.black),
              //     // ),
              //   ],
              // ),
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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded), label: 'Profile'),
              ],
            ),
            body: cubit.screans[cubit.currentIndex]);
      },
    );
  }
}
