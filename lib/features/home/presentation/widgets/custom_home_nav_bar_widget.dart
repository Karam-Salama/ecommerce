import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../cart/presentation/views/cart_view.dart';
import '../../../profile/presentation/views/profile_view.dart';
import '../../../saved/presentation/views/saved_view.dart';
import '../cubit/home_cubit.dart';
import '../views/home_view.dart';

class HomeNavBarWidget extends StatelessWidget {
  HomeNavBarWidget({super.key});

  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCategoryItems(),
      child: PersistentTabView(
        controller: _controller,
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: AppColors.backgroundColor,
        navBarStyle: NavBarStyle.style2,
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomeView(),
      SavedView(),
      CartView(),
      ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(Assets.assetsImagesBottomNavBarHomeVector),
        inactiveIcon: Image.asset(Assets.assetsImagesBottomNavBarHomeIcon),
        title: "Home",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(Assets.assetsImagesBottomNavBarSavedVector),
        inactiveIcon: Image.asset(Assets.assetsImagesBottomNavBarSavedIcon),
        title: "Saved",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(Assets.assetsImagesBottomNavBarCartVector),
        inactiveIcon: Image.asset(Assets.assetsImagesBottomNavBarCartIcon),
        title: "Cart",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(Assets.assetsImagesBottomNavBarUserVector),
        inactiveIcon: Image.asset(Assets.assetsImagesBottomNavBarUserIcon),
        title: "Account",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.greyColor,
      ),
    ];
  }
}
