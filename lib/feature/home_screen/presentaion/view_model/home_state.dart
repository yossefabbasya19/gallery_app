part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
/// connection update
final class UpdateConnection extends HomeState {}
/// get photo
final class GetPhotoSuccess extends HomeState {
  final List<Photos>photos;

  GetPhotoSuccess({required this.photos});
}
final class GetPhotoFailure extends HomeState {
  final String errorMessage;

  GetPhotoFailure({required this.errorMessage});
}
final class GetPhotoLoading extends HomeState {}
