import '../../../../core/utils/app_strings.dart';

class ProductModel {
  String productImage;
  String productName;
  String productPrice;
  String productRating;
  String productReviewCount;
  String productDescription;
  String productSize;
  String productColor;

  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productRating,
    required this.productReviewCount,
    required this.productDescription,
    required this.productSize,
    required this.productColor,
  });

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      productImage: jsonData[FirebaseCollectionName.productImage],
      productName: jsonData[FirebaseCollectionName.productName],
      productPrice: jsonData[FirebaseCollectionName.productPrice],
      productRating: jsonData[FirebaseCollectionName.productRating],
      productReviewCount: jsonData[FirebaseCollectionName.productReviewCount],
      productDescription: jsonData[FirebaseCollectionName.productDescription],
      productSize: jsonData[FirebaseCollectionName.productSize],
      productColor: jsonData[FirebaseCollectionName.productColor],
    );
  }
}
