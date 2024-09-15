import 'package:flutter/material.dart';

import '../widgets/custom_forget_password_form.dart';
import '../widgets/custom_forget_password_subtitle_widget.dart';
import '../widgets/custom_forget_password_title.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 60)),
            SliverToBoxAdapter(child: ForgetPasswordTitle()),
            SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(child: ForgetPasswordSubtitleWidget()),
            SliverToBoxAdapter(child: SizedBox(height: 52)),
            SliverToBoxAdapter(child: ForgetPasswordForm()),
          ],
        ),
      ),
    );
  }
}
