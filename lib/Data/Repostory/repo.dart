
import 'package:http/http.dart' as http;
import 'package:practiceapp/Data/Controller/user_cont.dart';
import 'package:practiceapp/Data/Models/user.dart';
class Repo{


  static Future<int> signupData(String name, String pass) async{


try{
var headers = {
  'Content-Type': 'application/x-www-form-urlencoded'
};
var request = http.Request('POST', Uri.parse('https://reqres.in/api/register'));
request.bodyFields = {
  'email': name,
  'password':pass,
};
request.headers.addAll(headers);

http.StreamedResponse response = await request.send();
print(response.statusCode);

if (response.statusCode == 200) {


  UserController.userClass=UserClass.fromRawJson(await response.stream.bytesToString());
  return response.statusCode;

}
return response.statusCode;

}

catch(e){
  print(e.toString());
  return 0;

}

  }
}