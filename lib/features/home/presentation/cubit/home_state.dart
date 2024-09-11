class HomeState {}

final class HomeInitial extends HomeState {}

class GetCategoryItemLoadingState extends HomeState {}

class GetCategoryItemSuccessState extends HomeState {}

class GetCategoryItemErrorState extends HomeState {
  final String errorMessage;

  GetCategoryItemErrorState({required this.errorMessage});
}
