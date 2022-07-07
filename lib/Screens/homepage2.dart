import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceapp/Cubits/cubit/emplyee_cubit_cubit.dart';
import 'package:practiceapp/Data/Controller/employee_controller.dart';

class HomePge2 extends StatefulWidget {
  const HomePge2({Key? key}) : super(key: key);

  @override
  State<HomePge2> createState() => _HomePge2State();
}

class _HomePge2State extends State<HomePge2> {
  @override
  void initState() {
    BlocProvider.of<EmplyeeCubitCubit>(context).getEmployee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<EmplyeeCubitCubit, EmplyeeCubitState>(
        listener: (context, state) {
            if ( state is EmplyeeCubitSocketException){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Internet Issue")));
                        }
                           if ( state is EmplyeeCubitLoaded){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Loaded")));
                        }
                           if ( state is EmplyeeCubitInitial){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Loading")));
                        }
        },
        child: BlocBuilder<EmplyeeCubitCubit, EmplyeeCubitState>(
          builder: (context, state) {
            if (state is EmplyeeCubitInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is EmplyeeCubitSocketException) {
              return const Center(
                child: Text('No Internet'),
              );
            }
            if (state is EmplyeeCubitLoaded) {
              return EmployeeController.demoClass!.data.isEmpty
                  ? const Text("Empty")
                  : ListView.builder(
                      itemCount: EmployeeController.demoClass!.data.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 200,
                          child: Column(
                            children: [
                              Expanded(
                                  child: Text(EmployeeController.demoClass!.data[index].name)),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                  child: Text(EmployeeController
                                      .demoClass!.data[index].id
                                      .toString()))
                            ],
                          ),
                        );
                      });
            }

            return Container();
          },
        ),
      ),
    );
  }
}
