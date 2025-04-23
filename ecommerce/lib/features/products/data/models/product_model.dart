import 'package:ecommerce/features/products/data/models/brand_model.dart';

class ProductModel {
  final String id;
  final String title;
  final BrandModel brand;
  final int regularPrice;
  final int currentPrice;
  final double rating;
  final List<String> photos;
  final List<String> sizes;
  final List<String> colors;
  final int availableQuantity;

  ProductModel(
      {required this.id,
      required this.title,
      required this.brand,
      required this.regularPrice,
      required this.currentPrice,
      required this.rating,
      required this.photos,
      required this.sizes,
      required this.colors,
      required this.availableQuantity});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> photoList = jsonData['photos'];
    List<dynamic> sizeList = jsonData['sizes'];
    List<dynamic> colorList = jsonData['colors'];

    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      brand: BrandModel.fromJson(jsonData['brand']),
      regularPrice: jsonData['regular_price'] ?? 0,
      currentPrice: jsonData['current_price'],
      rating: jsonData['rating'] ?? 0.0,
      photos: List<String>.from(photoList),
      sizes: List<String>.from(sizeList),
      colors: List<String>.from(colorList),
      availableQuantity: jsonData['quantity'],
    );
  }
}
