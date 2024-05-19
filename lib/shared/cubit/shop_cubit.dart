import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/12.get_cart_model.dart';
import 'package:shop_app/models/4.category_model.dart';
import 'package:shop_app/models/7.profile_model.dart';
import 'package:shop_app/models/9.change_favorites_model.dart';
import 'package:shop_app/shared/cubit/shop_state.dart';
import 'package:shop_app/shared/network/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import '../../models/10.get_favorite_model.dart';
import '../../models/11.change_cart_model.dart';
import '../../models/3.home_model.dart';
import '../../models/5.settings_model.dart';
import '../../modules/4.products/products_screen.dart';
import '../../modules/5.categories/categories.dart';
import '../../modules/6.favorites/favorites.dart';
import '../../modules/7.cart/cart_screen.dart';
import '../../modules/9.settings/settings.dart';
import '../constants/constants.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit() : super(ShopInitial());

  static ShopCubit get(context) => BlocProvider.of(context);
  List screans = [
    const ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;
  int Index = 0;

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavBarState());
  }

  void changeIndex(int index) {
    Index = index;
    emit(ShopChangeIndexState());
  }

  // todo//////////////////////////////////getProductData///////////////////////////
  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  Map<int, bool> carts = {};

  void getProductData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products!.forEach((element) {
        favorites.addAll({element.id!: element.inFavorites!});
      });
      //print(favorites);
      homeModel!.data!.products!.forEach((element) {
        carts.addAll({element.id!: element.inCart!});
      });
      print(carts);

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorHomeDataState(error: error.toString()));
    });
  }

  // //todo//////////////////////////////////getCategoriesData///////////////////////////
  CategoryModel? categoryModel;

  void getCategoryData() {
    emit(ShopLoadingCategoryDataState());
    DioHelper.getData(url: GET_CATEGORIES).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      emit(ShopSuccessCategoryDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryDataState(error: error.toString()));
    });
  }

  // //todo//////////////////////////////////getSettingsData///////////////////////////
  SettingsModel? settingsModel;

  void getSettingsData() {
    emit(ShopLoadingSettingsDataState());
    DioHelper.getData(
      url: SETTINGS,
    ).then((value) {
      settingsModel = SettingsModel.fromJson(value.data);
      //print(settingsModel!.data!.terms);
      emit(ShopSuccessSettingsDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorSettingsDataState(error: error.toString()));
    });
  }

  // //todo//////////////////////////////////getProfileData///////////////////////////

  ProfileModel? profileModel;

  void getProfileData() {
    emit(ShopLoadingProfileDataState());
    DioHelper.getData(
      token: token,
      url: PROFILE,
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      // print(profileModel!.data!.name);
      // print(profileModel!.data!.phone);
      emit(ShopSuccessProfileDataState(profileModel: profileModel));
    }).catchError((error) {
      print(error);
      emit(ShopErrorProfileDataState(error: error.toString()));
    });
  }

// ////todo//////////////////////////////////ChangeFavoritesData///////////////////////////
  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavoritesData({required int productId}) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessFavoritesDataState());
    DioHelper.postData(
        url: FAVORITES,
        token: token,
        data: {'product_id': productId}).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavoritesData();
      }
      emit(ShopSuccessChangeFavoritesDataState(
          changeFavoritesModel: changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      emit(ShopErrorChangeFavoritesDataState(error: error.toString()));
      print(error.toString());
    });
  }

//////todo//////////////////////////////////GetFavoritesData///////////////////////////

  GetFavoritesModel? getFavoritesModel;

  void getFavoritesData() {
    emit(ShopLoadingGetFavoritesDataState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      getFavoritesModel = GetFavoritesModel.fromJson(value.data);
      emit((ShopSuccessGetFavoritesDataState()));
    }).catchError((error) {
      emit(ShopErrorGetFavoritesDataState(error: error.toString()));
      print(error.toString());
    });
  }

// ////todo//////////////////////////////////ChangeCartData///////////////////////////
  ChangeCartModel? changeCartModel;

  void changeCartData({required int productId}) {
    carts[productId] = !carts[productId]!;
    emit(ShopSuccessCartDataState());
    DioHelper.postData(url: CART, token: token, data: {'product_id': productId})
        .then((value) {
      changeCartModel = ChangeCartModel.fromJson(value.data);
      print(value.data);
      if (!changeCartModel!.status!) {
        carts[productId] = !carts[productId]!;
      } else {
        getCartData();
      }
      emit(ShopSuccessChangeCartDataState(changeCartModel: changeCartModel!));
    }).catchError((error) {
      print(error.toString);
      carts[productId] = !carts[productId]!;
      emit(ShopErrorChangeCartDataState(error: error.toString()));
    });
  }

//////todo//////////////////////////////////GetCartData///////////////////////////

  GetCartModel? getCartModel;

  void getCartData() {
    emit(ShopLoadingGetCartDataState());
    DioHelper.getData(url: CART, token: token).then((value) {
      getCartModel = GetCartModel.fromJson(value.data);
      print(value.data);
      emit(ShopSuccessGetCartDataState());
    }).catchError((error) {
      emit(ShopErrorGetCartDataState(error: error.toString()));
    });
  }
}
