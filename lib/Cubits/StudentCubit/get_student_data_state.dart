part of 'get_student_data_cubit.dart';

@immutable
abstract class GetStudentDataState {}

class GetStudentDataInitial extends GetStudentDataState {}
class GetStudentDataLoading extends GetStudentDataState {}
class GetStudentDataLoaded extends GetStudentDataState {

  StudentData studentData;

  GetStudentDataLoaded({required this.studentData});





}
class GetStudentDatException extends GetStudentDataState {}
