import 'package:ecommerce_app/core/database/cache/cache_helper.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/service/service_locator.dart';
import 'ecommerce_app.dart';

// MVVM Architecture => Model, View, ViewModel(Bloc_State_Management)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUpServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const EcommerceApp());
}
