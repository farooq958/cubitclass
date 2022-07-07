part of 'user_cubit_cubit.dart';

@immutable
abstract class UserCubitState {}

class UserCubitInitial extends UserCubitState {}
class UserCubitLoading extends UserCubitState {}
class UserCubitLoaded extends UserCubitState {}
class UserCubitException extends UserCubitState {}