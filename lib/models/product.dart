import 'package:cloud_firestore/cloud_firestore.dart';

class CustomProductModel {
  final String id;
  final String name;
  final CustomProductStatus status;
  final CustomProductCategory category;
  final String price;
  final String company;
  final String faceUrl;
  final String backUrl;
  final String reviewedBy;
  final Timestamp reviewedAt;

  CustomProductModel({
    required this.id,
    required this.name,
    required this.status,
    required this.category,
    required this.price,
    required this.company,
    required this.faceUrl,
    required this.backUrl,
    required this.reviewedBy,
    required this.reviewedAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status.toShortStatus(),
        'category': category.toShortCategory(),
        'price': price,
        'company': company,
        'faceUrl': faceUrl,
        'backUrl': backUrl,
        'reviewedBy': reviewedBy,
        'reviewedAt': reviewedAt
      };
  static CustomProductModel fromJson(Map<String, dynamic> json) =>
      CustomProductModel(
        id: json['id'],
        name: json['name'],
        status: getCustomProductStatus(json['status']),
        category: getCustomProductCategory(json['category']),
        price: json['price'] + ' zł',
        company: json['company'],
        faceUrl: json['faceUrl'],
        backUrl: json['backUrl'],
        reviewedBy: json['reviewedBy'],
        reviewedAt: json['reviewedAt'],
      );
}

extension GetCustomProductStatus on CustomProductStatus {
  String toShortStatus() => toString().split('.').last.toLowerCase();
}

CustomProductStatus getCustomProductStatus(String str) {
  switch (str) {
    case 'halal':
      return CustomProductStatus.halal;
    case 'haram':
      return CustomProductStatus.haram;
    case 'mushbooh':
      return CustomProductStatus.mushbooh;
    case 'unknown':
      return CustomProductStatus.unknown;
    default:
      return CustomProductStatus.unknown;
  }
}

extension GetCustomProductCategory on CustomProductCategory {
  String toShortCategory() => toString().split('.').last.toLowerCase();
}

CustomProductCategory getCustomProductCategory(String str) {
  switch (str) {
    case 'bread':
      return CustomProductCategory.bread;
    case 'dessert':
      return CustomProductCategory.dessert;
    case 'drink':
      return CustomProductCategory.drink;
    case 'milk':
      return CustomProductCategory.milk;
    default:
      return CustomProductCategory.other;
  }
}

enum CustomProductStatus { halal, haram, mushbooh, unknown }

enum CustomProductCategory { bread, dessert, drink, milk, other }

Future<void> addProduct(
    CollectionReference reference, CustomProductModel newProduct) {
  return reference
      .doc(newProduct.id)
      .set(newProduct.toJson())
      .then((value) => print("success"))
      .catchError((error) => print("error: $error"));
}
