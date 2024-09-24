import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/navigation.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../auth/presentation/widgets/custom_success_bottom_sheet.dart';
import '../widgets/custom_profile_listTile_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: AppTextStyle.lato16style.copyWith(fontSize: 20),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.person,
              title: 'Your Profile',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.receipt_long,
              title: 'My Order',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.credit_card,
              title: 'Payment Methods',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.help,
              title: 'Help Center',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.group_add,
              title: 'Invite Friends',
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: Divider()),
          SliverToBoxAdapter(
            child: BuildMenuItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  isScrollControlled: true,
                  builder: (context) => SuccessBottomSheet(
                    title: 'Logout',
                    subtitle:
                        'Are you sure you want to log out?', // Confirmation message
                    buttonText1: 'Yes', // Text for confirmation
                    onButtonPressed: () {
                      FirebaseAuth.instance
                          .signOut(); // Handle the sign-out process
                      customReplacementNavigate(context, '/loginDefault');
                    },
                    buttonText2: 'No', // Text for cancellation
                    onButtonPressed2: () {
                      Navigator.of(context).pop(); // Close the bottom sheet
                    },
                  ),
                );
              },
              isLogout: true,
            ),
          ),
        ],
      ),
    );
  }
}
