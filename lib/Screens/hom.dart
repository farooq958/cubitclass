import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubits/StudentCubit/get_student_data_cubit.dart';

class HomeClass extends StatefulWidget {
  const HomeClass({Key? key}) : super(key: key);

  @override
  State<HomeClass> createState() => _HomeClassState();
}

class _HomeClassState extends State<HomeClass> {
  @override
  void initState() {
    BlocProvider.of<GetStudentDataCubit>(context).getStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          centerTitle: true,
          title: Text('HomePage')),

      body: BlocBuilder<GetStudentDataCubit, GetStudentDataState>(
        builder: (context, state) {
          if(state is GetStudentDataLoading){
            return Center(child: CircularProgressIndicator());

          }
          if(state is GetStudentDataLoaded) {
            return ListView.builder(
                itemCount: state.studentData.data.length,
                itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 100,
                color: Colors.grey,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Center(child: Text(state.studentData.data[index].email==null?"N/A":state.studentData.data[index].email!)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Center(child: Text(state.studentData.data[index].firstName)),
                      ),
                    )
                  ],
                ),
              );
            });
          }
          return Container();

        },
      ),

    )

    ;
  }
}
