import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double minPrice;
  final double maxPrice;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.minPrice,
    required this.maxPrice,
  });

  @override
  List<Object> get props => [id, name, description, imageUrl, minPrice, maxPrice];
}
