import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_home_layout.dart';
import 'package:shop_app/models/3.home_model.dart';
import 'package:shop_app/modules/8.search/search_cubit/shop_search_cubit.dart';
import 'package:shop_app/modules/8.search/search_cubit/shop_search_state.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../shared/components/textFormField.dart';
import 'build_product_search_item.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit, ShopSearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ShopSearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                    Icons.arrow_back_rounded
                ),
                onPressed: (){
               Navigator.pop(context,MaterialPageRoute(builder: (context) => ShopHomeLayout(),));
                },
              ),
              title: DefaultTextFormField(
                margin: 0.0,
                enabledBorder: Colors.black,
                focusedBorder: Colors.black,
                contentPadding: true,
                hintText: 'Search Salla.eg',
                prefixIcon: Icons.search,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'search must be fill';
                  }
                  return null;
                },
                onChanged: (value) {
                  cubit.SearchData(text: value);
                },
              ),
            ),
            body: Column(
              children: [
                SizedBox(height: 10.0,),
                if (state is ShopSearchLoadingState)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                    child: LinearProgressIndicator(color: baseColor,),
                  ),
                // if (state is ShopSearchSuccessState)
                //   Expanded(
                //     child: ListView.separated(
                //       physics: BouncingScrollPhysics(),
                //       separatorBuilder: (context, index) =>SizedBox(height: 10.0,),
                //       itemBuilder: (context, index) => BuildProductItem(
                //         subData:cubit.searchModel!.data!.subData![index],
                //       ),
                //       itemCount: cubit.searchModel!.data!.subData!.length,
                //     ),
                //   ),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.searchModel!=null,
                      builder: (context) => ListView.separated(
                        physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => BuildProductSearchItem(
                                  subData:cubit.searchModel!.data!.subData![index],
                                ),
                            separatorBuilder: (context, index) =>
                                SizedBox(
                                  height: 10.0,
                                ),
                            itemCount: cubit.searchModel!.data!.subData!.length,
                          ),
                      fallback: (context) =>
                          Image(
                            image: AssetImage('images/3371471.jpg'),
                          ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
