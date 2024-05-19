import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/8.search/search_cubit/shop_search_state.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../../../models/8.search_model.dart';
import '../../../shared/constants/constants.dart';

class ShopSearchCubit extends Cubit<ShopSearchState> {
  ShopSearchCubit() : super(ShopSearchInitial());

  static ShopSearchCubit get(context) => BlocProvider.of(context);
  SearchModel? searchModel;

  void SearchData({required String text}) {
    emit(ShopSearchLoadingState());
    DioHelper.postData(url: SEARCH, token: token, data: {'text': text})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      emit(ShopSearchSuccessState());
    }).catchError((error) {
      print(error);
      emit(ShopSearchErrorState(error:error.toString()));
    });
  }
}
