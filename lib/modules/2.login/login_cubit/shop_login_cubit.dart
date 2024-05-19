import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/2.login/login_cubit/shop_login_state.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../../../models/2.login_model.dart';
import '../../../shared/network/end_points.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitial());

  ShopLoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();

//todo/////////////passwordVisibility////////////////////////////////////
  bool isPassword = true;

  void isVisibility() {
    isPassword = !isPassword;
    emit(ShopLoginVisibilityState());
  }

//todo/////////////LoginPost/////////////////////////////////////////////

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.data!.name);
      emit(ShopLoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error);
      emit(ShopLoginErrorState(error: error.toString()));
    });
  }
}
