
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:practiceapp/Cubits/StudentCubit/get_student_data_cubit.dart';
import 'package:practiceapp/Data/Models/student.dart';
class  Repo{

  static Future<StudentData?> getStudentData()async{
    var request = http.Request('GET', Uri.parse('https://reqres.in/api/users?page=2'));


    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

       StudentData studentData= StudentData.fromRawJson(await response.stream.bytesToString());
       print(studentData.data.length);

      return studentData;
    }
    else {
    print(response.reasonPhrase);
    return null;
    }

  }



}