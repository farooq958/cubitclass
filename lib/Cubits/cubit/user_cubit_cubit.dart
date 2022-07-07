import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:practiceapp/Data/Repostory/repo.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {
  UserCubitCubit() : super(UserCubitInitial());


  SignUpUser(String name,String pass) async{
print("user");

    emit(UserCubitLoading());
    final status=await Repo.signupData(name, pass);
    print("STATUS $status");
    if(status==200){
      emit(UserCubitLoaded());
    }
    else{
      emit(UserCubitException());
    }
  }
}
