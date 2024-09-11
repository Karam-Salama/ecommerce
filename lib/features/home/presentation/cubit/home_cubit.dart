import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryItemModel> categoriesList = [];

  Future<void> getCategoryItems() async {
    try {
      emit(GetCategoryItemLoadingState());

      final categorySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.category_item)
          .get();
      for (var element in categorySnapshot.docs) {
        List<ProductModel> productsList = []; 
        await getProductsList(element, productsList);
        categoriesList.add(
          CategoryItemModel.fromJson(element.data(), productsList),
        );
      }
      
      emit(GetCategoryItemSuccessState());
    } catch (e) {
      emit(GetCategoryItemErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getProductsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element,
      List<ProductModel> productsList) async {
    try {
      final productsSnapshot = await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.category_item)
          .doc(element.id)
          .collection(FirebaseCollectionName.products)
          .get();

      for (var productElement in productsSnapshot.docs) {
        productsList.add(ProductModel.fromJson(productElement.data()));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching products for category ${element.id}: ${e.toString()}');
      }
    }
  }
}
