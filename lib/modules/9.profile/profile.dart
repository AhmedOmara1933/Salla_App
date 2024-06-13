import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/2.login/login_screen.dart';
import 'package:shop_app/shared/components/default_button.dart';
import 'package:shop_app/shared/cubit/shop_cubit.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../shared/components/build_settings_card.dart';
import '../../shared/components/textFormField.dart';
import '../6.favorites/favorites.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
        // if(state is ShopSuccessProfileDataState){
        //   print(state.profileModel!.data!.name!);
        //   print(state.profileModel!.data!.email!);
        //   print(state.profileModel!.data!.phone!);
        //     nameController.text=state.profileModel!.data!.name!;
        //     emailController.text=state.profileModel!.data!.email!;
        //     phoneController.text=state.profileModel!.data!.phone!;
        //
        // }
      },
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        // nameController.text = cubit.profileModel!.data!.name!;
        // emailController.text = cubit.profileModel!.data!.email!;
        // phoneController.text = cubit.profileModel!.data!.phone!;
        return ConditionalBuilder(
          condition: cubit.profileModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                            height: 130.0,
                            width: 130.0,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: baseColor, width: 3.0),
                                borderRadius:
                                    BorderRadiusDirectional.circular(100)),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadiusDirectional.circular(100.0),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image(
                                image: AssetImage(
                                  'images/bohemian-man-with-his-arms-crossed.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                          height: 35.0,
                          width: 35.0,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2.0),
                              color: baseColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      '${cubit.profileModel!.data!.name}',
                      style: TextStyle(
                          fontSize: 23.0, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '${cubit.profileModel!.data!.email}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    BuildSettingsCard(
                      text: 'My Account',
                      prefixIcon: Icons.person_outlined,
                      iconPressed: () {},
                    ),
                    BuildSettingsCard(
                      text: 'Password',
                      prefixIcon: Icons.lock_open_outlined,
                      iconPressed: () {},
                    ),
                    BuildSettingsCard(
                      text: 'Favorites',
                      prefixIcon: Icons.favorite_outline,
                      iconPressed: () {
                        navigateTo(context, FavoritesScreen(), false);
                      },
                    ),
                    BuildSettingsCard(
                      text: 'Settings',
                      prefixIcon: Icons.settings,
                      iconPressed: () {},
                    ),
                    BuildSettingsCard(
                      text: 'Help Center',
                      prefixIcon: Icons.help_outline_outlined,
                      iconPressed: (){},
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
               DefaultButton(
                   text: 'LOG OUT',
                   onPressed:(){
                     CacheHelper.removeData(key: 'token').then((value) {
                       navigateTo(context, ShopLoginScreen(), true);
                     });
                   }
               )
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

// DefaultTextFormField(
//   validate: (value) {
//     if (value!.isEmpty) {
//       return 'name must be fill';
//     }
//     return null;
//   },
//   hintText: 'Name',
//   margin: 15.0,
//   controller: nameController,
//   prefixIcon: Icons.person,
// ),
// DefaultTextFormField(
//   validate: (value) {
//     if (value!.isEmpty) {
//       return 'emil must be fill';
//     }
//     return null;
//   },
//   hintText: 'Email Address',
//   margin: 15.0,
//   controller: emailController,
//   prefixIcon: Icons.email,
// ),
// DefaultTextFormField(
//   hintText: 'phone',
//   validate: (value) {
//     if (value!.isEmpty) {
//       return 'phone must be fill';
//     }
//     return null;
//   },
//   margin: 15.0,
//   controller: phoneController,
//   prefixIcon: Icons.phone,
// ),
