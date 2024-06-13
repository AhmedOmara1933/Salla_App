import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/2.login/login_screen.dart';
import 'package:shop_app/modules/3.register/register_cubit/shop_register_cubit.dart';
import 'package:shop_app/modules/3.register/register_cubit/shop_register_state.dart';
import 'package:shop_app/shared/function/function.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import '../../shared/components/default_button.dart';
import '../../shared/components/textFormField.dart';

// ignore: must_be_immutable
class ShopRegisterScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ShopRegisterSuccessState) {
            if (state.registerModel!.status!) {
              print(state.registerModel!.message);
              print(state.registerModel!.data!.token);
              CacheHelper.saveData(
                      key: 'token', value: state.registerModel!.data!.token)
                  .then((value) {
                navigateTo(context, ShopLoginScreen(), true);
              });
              flutterToast(msg: state.registerModel!.message!);
            } else {
              flutterToast(msg: state.registerModel!.message!);
            }
          }
        },
        builder: (context, state) {
          var cubit = ShopRegisterCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('images/register.jpg'),
                              height: 300.0,
                              width: 300.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Register here to browse our hot offers',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        DefaultTextFormField(
                          controller: nameController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' Name must be fill';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Name',
                          prefixIcon: Icons.person_outlined,
                        ),
                        DefaultTextFormField(
                          controller: phoneController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return ' phone must be fill';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                          prefixIcon: Icons.phone,
                        ),
                        DefaultTextFormField(
                          controller: emailController,
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
                          controller: passwordController,
                          obscureText: cubit.isPassword,
                          keyboardType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be fill';
                            }
                            return null;
                          },
                          suffixIcon: cubit.isPassword == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          suffixOnPressed: () {
                            cubit.isPasswordVisibility();
                          },
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingState,
                          builder: (context) => DefaultButton(
                            text: 'Sign Up',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.userRegister(
                                    name: emailController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator(color: baseColor,)),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Do have an account ? ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                navigateTo(context, ShopLoginScreen(), false);
                              },
                              child: Text(
                                'Sign In Now',
                                style: TextStyle(color:baseColor),
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
