// ignore_for_file: missing_required_param

import '../../../core/helper/api.dart';
import '../presentation/models/product_model.dart';

class ProductsByCategoryNameServices {
  Future<List<ProductModel>> getProductsByCategories(
      {required String category}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$category');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(ProductModel.fromJson(data[i]));
    }
    return productsList;
  }
}
