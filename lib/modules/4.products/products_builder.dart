import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import '../../models/3.home_model.dart';
import '../../shared/components/build_grid_product.dart';
import '../../shared/components/build_list_category.dart';

// ignore: must_be_immutable
class ProductsBuilder extends StatelessWidget {
  HomeModel model;

  ProductsBuilder({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              //CarouselIndicator && CarouselSlider
              Column(
                children: [
                  Container(
                    
                    child: CarouselSlider(
                      items: model.data!.banners!
                          .map(
                            (e) => CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: '${e.image}',
                              progressIndicatorBuilder:
                                  (context, url, progress) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                  child: const CircularProgressIndicator()),
                            ),
                      )
                          .toList(),
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          cubit.changeIndex(index);
                        },
                        height: 150.0,
                        viewportFraction:0.5,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  CarouselIndicator(
                    animationDuration: 2,
                    color: Colors.grey,
                    height: 7.0,
                    width: 7.0,
                    count: model.data!.banners!.length,
                    activeColor: Colors.blue,
                    index: cubit.Index,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
              //Categories
              SizedBox(
                height: 35.0,
                child: Container(
                  color: Color(0xfffce7ba),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //BuildListCategory
              Container(
                height: 188.0,
                child: ListView.separated(
                  padding:
                  EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => BuildListCategory(
                      model: cubit.categoryModel!.data!.data[index]),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15.0,
                  ),
                  itemCount: cubit.categoryModel!.data!.data.length,
                ),
              ),
              //Best selling products
              SizedBox(
                height: 35.0,
                child: Container(
                  color: Color(0xfffce7ba),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Best selling products',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //BuildGridProduct
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30.0)),
                child: GridView.count(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding:EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                  physics:const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 1 / 2.07,
                  children: List.generate(
                      model.data!.products!.length,
                          (index) => BuildGridProduct(
                        products: model.data!.products![index],
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
