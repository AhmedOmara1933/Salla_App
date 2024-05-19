class CategoryModel {
  bool? status;
  CategoryDataModel? data;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null
        ? new CategoryDataModel.fromJson(json['data'])
        : null;
  }
}

class CategoryDataModel {
  int? currentPage;
  List<DataModel> data = [];

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];

    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data.add(new DataModel.fromJson(v));
      });
    }
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
