// ignore_for_file: missing_required_param

import '../../../core/helper/api.dart';
import '../presentation/models/product_model.dart';

class PutProductByIdServices {
  Future<ProductModel> putProductById({
    required String id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
