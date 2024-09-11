// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/utils/app_strings.dart';
import 'package:ecommerce_app/features/home/data/models/category_item_model.dart';
import 'package:ecommerce_app/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<CategoryItemModel> categoriesList = [];
  List<ProductModel> productList = [];

  Future<void> getCategoryItems() async {
    try {
      emit(GetCategoryItemLoadingState());

      await FirebaseFirestore.instance
          .collection(FirebaseCollectionName.category_item)
          .get()
          .then(
            (value) => value.docs.forEach(
              (element) async {
                await getProductsList(element);
                categoriesList.add(
                  CategoryItemModel.fromJson(element.data(), productList),
                );
                emit(GetCategoryItemSuccessState());
              },
            ),
          );
    } catch (e) {
      emit(GetCategoryItemErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getProductsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    await FirebaseFirestore.instance
        .collection(FirebaseCollectionName.category_item)
        .doc(element.id)
        .collection(FirebaseCollectionName.products)
        .get()
        .then(
          (value) => value.docs.forEach(
            (element) {
              productList.add(
                ProductModel.fromJson(
                  element.data(),
                ),
              );
            },
          ),
        );
  }
}
