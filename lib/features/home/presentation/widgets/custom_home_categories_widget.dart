import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/widgets/custom_error_bottom_sheet.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'custom_home_categories_item_widget.dart';
import 'custom_shimmer_category_list_view-item.dart';

class HomeCategoriesListView extends StatelessWidget {
  const HomeCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetCategoryItemErrorState) {
          handleErrorStateForGetDate(context, state);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 133,
          child: state is GetCategoryItemLoadingState
              ? ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (_, index) {
                    return const ShimmerCategoryListViewItem();
                  },
                  itemCount: 6,
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (_, index) {
                    return HomeCategoryListViewItem(
                      model: context.read<HomeCubit>().categoriesList[index],
                    );
                  },
                  itemCount: context.read<HomeCubit>().categoriesList.length,
                ),
        );
      },
    );
  }
}

void handleErrorStateForGetDate(
    BuildContext context, GetCategoryItemErrorState state) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    isScrollControlled: true,
    builder: (context) => ErrorBottomSheet(
      errorMessage: state.errorMessage,
      buttonText: 'Try Again',
      onButtonPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}
