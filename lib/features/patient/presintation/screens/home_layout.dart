import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Home"),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },)
          ),
          body: PatientCubit.get(context).screens[PatientCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: primaryColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: PatientCubit.get(context).currentIndex,
            items: [
              BottomNavigationBarItem(icon: InkWell(
                onTap: (){
                  PatientCubit.get(context).changeHomescreen(0);
                },
                child: Icon(Icons.home)), label: 'Home',),
              BottomNavigationBarItem(icon: InkWell(
                  onTap: (){
                  PatientCubit.get(context).changeHomescreen(1);
                },
                child: Icon(Icons.chat)), label: 'chats'),
              BottomNavigationBarItem(
                icon: InkWell(
                    onTap: (){
                  PatientCubit.get(context).changeHomescreen(2);
                },
                  child: Icon(Icons.notifications)),
                label: 'notifications',
              ),
            ],
          ),
        );
      },
    );
  }
}
