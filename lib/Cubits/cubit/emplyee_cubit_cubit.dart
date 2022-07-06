// ignore_for_file: unrelated_type_equality_checks

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practiceapp/Data/Repostory/demo_repo.dart';

part 'emplyee_cubit_state.dart';

class EmplyeeCubitCubit extends Cubit<EmplyeeCubitState> {
  EmplyeeCubitCubit() : super(EmplyeeCubitInitial());

  getEmployee() async{
    try{
  emit(EmplyeeCubitInitial());
     final statuscode= await  DemoRepo.getallEmploye();
     print(statuscode);
     if(statuscode==200){
      emit(EmplyeeCubitLoaded());
     }
     else if (statuscode==501){
      emit(EmplyeeCubitSocketException());
     }
     else if (statuscode==401){
      emit(EmplyeeCubitInternalSever());
     }
     else if (statuscode==201){
      emit(EmplyeeCubitPageImageError());
     }

    }
    catch(e){
      emit(EmplyeeCubitException());

    }
  }


}
