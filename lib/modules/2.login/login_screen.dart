import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/components/textFormField.dart';
import 'package:shop_app/shared/constants/constants.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../layout/shop_home_layout.dart';
import '../3.register/register_screen.dart';
import 'login_cubit/shop_login_cubit.dart';
import 'login_cubit/shop_login_state.dart';

// ignore: must_be_immutable
class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel!.status!) {
              print(state.loginModel!.message);
              print(state.loginModel!.data!.token);
              flutterToast(msg: state.loginModel!.message!);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel!.data!.token)
                  .then((value) {
                    token=state.loginModel!.data!.token!;
                navigateTo(context, const ShopHomeLayout(), true);
              });
            }
            else {
              print(state.loginModel!.message);
              flutterToast(msg: state.loginModel!.message!);
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopLoginCubit().get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/img.png'),
                              height: 250.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Login here to browse our hot offers',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        DefaultTextFormField(
                          controller: cubit.email,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Email Address must be fill';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Email Address',
                          prefixIcon: Icons.email,
                        ),
                        DefaultTextFormField(
                          controller: cubit.password,
                          onChanged: (value) {
                            // if (cubit.formKey.currentState!.validate()) {
                            //   cubit.userLogin(
                            //       email: cubit.email.text,
                            //       password: cubit.password.text);
                            // }
                          },
                          keyboardType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be fill';
                            }
                            return null;
                          },
                          obscureText: cubit.isPassword,
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                          suffixIcon: cubit.isPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixOnPressed: () {
                            cubit.isVisibility();
                          },
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => MaterialButton(
                            onPressed: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.userLogin(
                                    email: cubit.email.text,
                                    password: cubit.password.text);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: baseColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(
                                    context, ShopRegisterScreen(), false);
                              },
                              child: Text(
                                'Register Now',
                                style: TextStyle(color: baseColor),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
