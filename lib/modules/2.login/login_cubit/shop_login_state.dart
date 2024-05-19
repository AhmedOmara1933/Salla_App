import '../../../models/2.login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginInitial extends ShopLoginStates {}

class ShopLoginVisibilityState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final LoginModel ?loginModel;

  ShopLoginSuccessState({required this.loginModel});
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState({required this.error});
}
