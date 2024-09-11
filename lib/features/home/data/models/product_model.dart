import '../../../../core/utils/app_strings.dart';

class ProductModel {
  String productImage;
  String productName;
  String productOriginalPrice;
  String productRating;
  String productReviewCount;
  String productDescription;
  String productSize;
  String productColor;

  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productOriginalPrice,
    required this.productRating,
    required this.productReviewCount,
    required this.productDescription,
    required this.productSize,
    required this.productColor,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      productImage: jsonData[FirebaseCollectionName.productImages],
      productName: jsonData[FirebaseCollectionName.productName],
      productOriginalPrice:jsonData[FirebaseCollectionName.productOriginalPrice],
      productRating: jsonData[FirebaseCollectionName.productRating],
      productReviewCount: jsonData[FirebaseCollectionName.productReviewCount],
      productDescription: jsonData[FirebaseCollectionName.productDescription],
      productSize: jsonData[FirebaseCollectionName.productSizes],
      productColor: jsonData[FirebaseCollectionName.productColors],
    );
  }
}
