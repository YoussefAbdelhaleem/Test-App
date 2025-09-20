part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BannerLoadingState extends HomeState {}

final class BannerSuccessState extends HomeState {}

final class BannerErrorState extends HomeState {
  final String msg;
  BannerErrorState(this.msg);
}
