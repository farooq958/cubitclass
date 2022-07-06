part of 'emplyee_cubit_cubit.dart';

@immutable
abstract class EmplyeeCubitState {}

class EmplyeeCubitInitial extends EmplyeeCubitState {}
class EmplyeeCubitLoaded extends EmplyeeCubitState {}
class EmplyeeCubitSocketException extends EmplyeeCubitState {}
class EmplyeeCubitInternalSever extends EmplyeeCubitState {}
class EmplyeeCubitPageImageError extends EmplyeeCubitState {}
class EmplyeeCubitException extends EmplyeeCubitState {}
