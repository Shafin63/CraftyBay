class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final String photo;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.photo,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      currentPrice: json['current_price'],
      photo: json['photo']['0'], //TODO: find a better way to handle null or empty list
    );
  }
}
