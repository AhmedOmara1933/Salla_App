import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import '../../shared/components/textFormField.dart';
import 'categories_builder.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=ShopCubit.get(context);
        return  ConditionalBuilder(
            condition: cubit.categoryModel !=null,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) => CategoriesBuilder(model:cubit.categoryModel!.data!.data[index]),
                separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                itemCount:cubit.categoryModel!.data!.data.length
            ),
            fallback: (context) =>
                Center(child: CircularProgressIndicator()));
      },
    );
  }
}
