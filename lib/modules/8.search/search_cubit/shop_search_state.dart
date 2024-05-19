abstract class ShopSearchState {}

class ShopSearchInitial extends ShopSearchState {}

class ShopSearchSuccessState extends ShopSearchState {}

class ShopSearchErrorState extends ShopSearchState {
  final String error;

  ShopSearchErrorState({required this.error});
}

class ShopSearchLoadingState extends ShopSearchState {}
