import '../../../../core/models/data_model.dart';
import '../../../../core/utils/app_strings.dart';
import 'product_model.dart';

class CategoryItemModel extends DataModel {
  final List<ProductModel> products;

  CategoryItemModel({
    required super.name,
    required super.image,
    required this.products,
  });

  factory CategoryItemModel.fromJson(jsonData,productsList) {
    return CategoryItemModel(
      name: jsonData[FirebaseCollectionName.name],
      image: jsonData[FirebaseCollectionName.image],
      products: productsList,
    );
  }
}
