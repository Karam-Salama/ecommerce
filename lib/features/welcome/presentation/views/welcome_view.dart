import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../core/functions/navigation.dart';
import '../../../../core/service/service_locator.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../widgets/custom_welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                const CustomWelcomeBody(),
                const SizedBox(height: 234),
                CustomButton(
                    text: AppStrings.getStarted,
                    onPressed: () {
                      getIt<CacheHelper>()
                          .saveData(key: "welcomeVisited", value: true);
                      customReplacementNavigate(context, "/signup");
                    }),
                const SizedBox(height: 41),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
