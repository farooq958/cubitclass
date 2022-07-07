import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceapp/Cubits/StudentCubit/get_student_data_cubit.dart';
import 'package:practiceapp/Cubits/cubit/emplyee_cubit_cubit.dart';
import 'package:practiceapp/Cubits/cubit/user_cubit_cubit.dart';
import 'package:practiceapp/Screens/hom.dart';
import 'package:practiceapp/Screens/homepage2.dart';
import 'package:practiceapp/Screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const StudentClass()
    );
  }
}

class StudentClass extends StatefulWidget {
  const StudentClass({Key? key}) : super(key: key);

  @override
  State<StudentClass> createState() => _StudentClassState();
}

class _StudentClassState extends State<StudentClass> {


  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
    BlocProvider<GetStudentDataCubit>(
    create: (BuildContext context) => GetStudentDataCubit(),
    ),
BlocProvider<EmplyeeCubitCubit>(
    create: (BuildContext context) => EmplyeeCubitCubit(),
    ),
    BlocProvider<UserCubitCubit>(
    create: (BuildContext context) => UserCubitCubit(),
    ),

     ],
     child:  const MaterialApp(

        home: LoginSCreen(),),
    );
  }
}