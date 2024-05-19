// class HomeModel {
//   bool? status;
//   Null? message;
//   Data? data;
//
//   HomeModel({this.status, this.message, this.data});
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }
//
// class Data {
//   List<Banners>? banners;
//   String? ad;
//
//   Data({this.banners, this.ad});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       banners = <Banners>[];
//       json['banners'].forEach((v) {
//         banners!.add(new Banners.fromJson(v));
//       });
//     }
//     ad = json['ad'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.banners != null) {
//       data['banners'] = this.banners!.map((v) => v.toJson()).toList();
//     }
//     data['ad'] = this.ad;
//     return data;
//   }
// }
//
// class Banners {
//   int? id;
//   String? image;
//   Null? category;
//   Null? product;
//
//   Banners({this.id, this.image, this.category, this.product});
//
//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     category = json['category'];
//     product = json['product'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['image'] = this.image;
//     data['category'] = this.category;
//     data['product'] = this.product;
//     return data;
//   }
// }
//todo////////////////////////////////////////////////////////////////
// class HomeModel {
//   bool? status;
//   Data? data;
//
//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = Data.fromJson(json['data']);
//   }
// }
//
// class Data {
//   List<Banners> banners = [];
//   List<Products> products = [];
//
//   Data.fromJson(Map<String, dynamic> json) {
//     json['banners'].forEach((element) {
//       banners.add(element);
//     });
//     json['products'].forEach((element) {
//       products.add(element);
//     });
//   }
// }
//
// class Banners {
//   int? id;
//   String? image;
//
//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }
//
// class Products {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String? image;
//   String? name;
//   bool? inFavorites;
//   bool? inCart;
//
//   Products(
//       {this.id,
//       this.price,
//       this.oldPrice,
//       this.discount,
//       this.image,
//       this.name,
//       this.inFavorites,
//       this.inCart});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }

class HomeModel {
  bool? status;
  Null? message;
  Data? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    ad = json['ad'];
  }
}

class Banners {
  int? id;
  String? image;
  Null? category;
  Null? product;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
