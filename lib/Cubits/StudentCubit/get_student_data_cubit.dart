import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practiceapp/Data/Models/student.dart';
import 'package:practiceapp/Data/Repostory/student_repo.dart';

part 'get_student_data_state.dart';

class GetStudentDataCubit extends Cubit<GetStudentDataState> {
  GetStudentDataCubit() : super(GetStudentDataInitial());

  getStudentData() async {
    try {
      emit(GetStudentDataLoading());

      final data = await Repo.getStudentData();
      emit(GetStudentDataLoaded(studentData: data!));
    } catch (e) {
      emit(GetStudentDatException());
    }
  }
}
