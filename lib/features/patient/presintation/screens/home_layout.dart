import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/data/repository.dart';
import 'package:we_care/features/patient/domain/usecase/getAppointments.dart';
import 'package:we_care/features/patient/domain/usecase/get_patient_data_Usecase.dart';
import 'package:we_care/features/patient/domain/usecase/makeAppoinmentusecase.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';
import 'package:we_care/features/patient/widgets/drawer.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  // Define a GlobalKey for ScaffoldState
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create:
          (context) => PatientCubit(
            GetPatientDataUsecase(
              PatientRepositoryImpl(Supabase.instance.client),
            ),
            Makeappoinmentusecase(
              PatientRepositoryImpl(Supabase.instance.client),
            ),
            Getappointmentsusecase(
              PatientRepositoryImpl(Supabase.instance.client),
            ),
          )..getPatientData(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
              PatientEntitiy patient = PatientCubit.get(context).patientDataa.isNotEmpty
                  ? PatientCubit.get(context).patientDataa[0]
                  : PatientEntitiy(name: 'Loading...', id: '', phone: '', address: '', job: '', age: 1, gender: ''); // Fallback
          return Scaffold(
            key: _scaffoldKey, // Set the GlobalKey to Scaffold
            appBar: AppBar(
              title: Text("Home"),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  // Use the GlobalKey to open the drawer
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
            ),
            drawer: drawer(patient: patient,),
            body:
                PatientCubit.get(context).screens[PatientCubit.get(
                  context,
                ).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              backgroundColor: primaryColor,
              type: BottomNavigationBarType.fixed,
              currentIndex: PatientCubit.get(context).currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      PatientCubit.get(context).changeHomescreen(0);
                    },
                    child: Icon(Icons.home),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      PatientCubit.get(context).changeHomescreen(1);
                    },
                    child: Icon(Icons.calendar_month_sharp),
                  ),
                  label: 'Appointments',
                ),
                BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: () {
                      PatientCubit.get(context).changeHomescreen(2);
                    },
                    child: Icon(Icons.notifications),
                  ),
                  label: 'Notifications',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
