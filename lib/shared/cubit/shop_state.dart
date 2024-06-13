import 'package:shop_app/models/11.change_cart_model.dart';
import 'package:shop_app/models/7.profile_model.dart';
import 'package:shop_app/models/9.change_favorites_model.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopChangeBottomNavBarState extends ShopState {}

class ShopChangeIndexState extends ShopState {}
//////todo//////////////////////////////////GetHomeDataState///////////////////////////

class ShopLoadingHomeDataState extends ShopState {}

class ShopSuccessHomeDataState extends ShopState {}

class ShopErrorHomeDataState extends ShopState {
  final String error;

  ShopErrorHomeDataState({required this.error});
}
//////todo//////////////////////////////////GetCategoriesDataState///////////////////////////

class ShopLoadingCategoryDataState extends ShopState {}

class ShopSuccessCategoryDataState extends ShopState {}

class ShopErrorCategoryDataState extends ShopState {
  final String error;

  ShopErrorCategoryDataState({required this.error});
}
//////todo//////////////////////////////////GetSettingsDataState///////////////////////////

class ShopLoadingSettingsDataState extends ShopState {}

class ShopSuccessSettingsDataState extends ShopState {}

class ShopErrorSettingsDataState extends ShopState {
  final String error;

  ShopErrorSettingsDataState({required this.error});
}
//////todo//////////////////////////////////GetProfileDataState///////////////////////////

class ShopLoadingProfileDataState extends ShopState {}

class ShopSuccessProfileDataState extends ShopState {
  final ProfileModel? profileModel;

  ShopSuccessProfileDataState({required this.profileModel});
}

class ShopErrorProfileDataState extends ShopState {
  final String error;

  ShopErrorProfileDataState({required this.error});
}
//////todo//////////////////////////////////ChangeFavoritesDataState///////////////////////////

class ShopLoadingChangeFavoritesDataState extends ShopState {}

class ShopSuccessChangeFavoritesDataState extends ShopState {
  final ChangeFavoritesModel changeFavoritesModel;

  ShopSuccessChangeFavoritesDataState({required this.changeFavoritesModel});
}

class ShopSuccessFavoritesDataState extends ShopState {}

class ShopErrorChangeFavoritesDataState extends ShopState {
  final String error;

  ShopErrorChangeFavoritesDataState({required this.error});
}

//////todo//////////////////////////////////GetFavoritesDataState///////////////////////////

class ShopLoadingGetFavoritesDataState extends ShopState {}

class ShopSuccessGetFavoritesDataState extends ShopState {}

class ShopErrorGetFavoritesDataState extends ShopState {
  final String error;

  ShopErrorGetFavoritesDataState({required this.error});
}

//////todo//////////////////////////////////ChangeCartDataState///////////////////////////

class ShopLoadingChangeCartDataState extends ShopState {}

class ShopSuccessChangeCartDataState extends ShopState {
  final ChangeCartModel changeCartModel;

  ShopSuccessChangeCartDataState({required this.changeCartModel});
}

class ShopSuccessCartDataState extends ShopState {}

class ShopErrorChangeCartDataState extends ShopState {
  final String error;

  ShopErrorChangeCartDataState({required this.error});
}
//////todo//////////////////////////////////GetCartDataState///////////////////////////

class ShopLoadingGetCartDataState extends ShopState {}

class ShopSuccessGetCartDataState extends ShopState {}

class ShopErrorGetCartDataState extends ShopState {
  final String error;

  ShopErrorGetCartDataState({required this.error});
}

class ShopSuccessUpdateCartQuantityState extends ShopState {}
