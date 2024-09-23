// ignore_for_file: missing_required_param
import 'package:flutter/foundation.dart';

import '../../../core/helper/api.dart';
import '../presentation/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts({required String url}) async {
    try {
      List<dynamic> data =
          await Api().get(url: url);
      List<ProductModel> productsList = [];
      for (int i = 0; i < data.length; i++) {
        productsList.add(ProductModel.fromJson(data[i]));
      }
      return productsList;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products: $e');
      }
      rethrow; 
    }
  }
}
