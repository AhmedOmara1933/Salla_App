import 'package:shop_app/models/6.register_model.dart';

abstract class ShopRegisterState {}

class ShopRegisterInitial extends ShopRegisterState {}

class ShopRegisterVisibilityState extends ShopRegisterState {}

class ShopRegisterLoadingState extends ShopRegisterState {}

class ShopRegisterSuccessState extends ShopRegisterState {
  final RegisterModel? registerModel;

  ShopRegisterSuccessState({required this.registerModel});
}

class ShopRegisterErrorState extends ShopRegisterState {
  final String error;

  ShopRegisterErrorState({required this.error});
}
