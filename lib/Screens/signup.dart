import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practiceapp/Cubits/cubit/user_cubit_cubit.dart';
import 'package:practiceapp/Screens/hom.dart';

class LoginSCreen extends StatelessWidget {
  const LoginSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      body: BlocListener<UserCubitCubit, UserCubitState>(
        listener: (context, state) {
         if (state is UserCubitLoaded ){

          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeClass()));
         }
         if (state is UserCubitException ){

         Scaffold.of(context).showSnackBar(SnackBar(content: Text("Exception Occured")));
         }
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            shrinkWrap: true,
            children: [
              TextField(
                controller: name,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
              
                controller: password,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  BlocProvider.of<UserCubitCubit>(context)
                      .SignUpUser(name.text, password.text);
                      
                },
                child: BlocBuilder<UserCubitCubit, UserCubitState>(
                  builder: (context, state) {
                    print(state);
                    if (state is UserCubitLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if(state is UserCubitException){
                      return Text("Exception");
                    }

                    return Text("Submit");
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
