import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/6.register_model.dart';
import 'package:shop_app/modules/3.register/register_cubit/shop_register_state.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../../../shared/network/end_points.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState> {
  ShopRegisterCubit() : super(ShopRegisterInitial());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;

//todo/////////////passwordVisibility////////////////////////////////////

  void isPasswordVisibility() {
    isPassword = !isPassword;
    emit(ShopRegisterVisibilityState());
  }

//todo/////////////RegisterPost/////////////////////////////////////////////

  RegisterModel ?registerModel;
  userRegister({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) {
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    }).then((value) {
      registerModel=RegisterModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(registerModel: registerModel));
      print(value);
    }).catchError((error) {
      emit(ShopRegisterErrorState(error: error.toString()));
    });
  }
}

