import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/features/patient/data/repository.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';
import 'package:we_care/features/patient/domain/usecase/getAppointments.dart';
import 'package:we_care/features/patient/domain/usecase/get_patient_data_Usecase.dart';
import 'package:we_care/features/patient/domain/usecase/makeAppoinmentusecase.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';

class Myappointmetns extends StatelessWidget {
  const Myappointmetns({super.key});

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
          )..getAppointments(),
      child: BlocConsumer<PatientCubit, PatientState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<Appointment> appointments = [];
          if(state is getAppointmentSuccess){
           appointments=state.appointments;
          }
          if (state is getAppointmentLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return  Scaffold(
            body: 
            
            appointments.length!=0?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16   ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text( "you have an appointment ",style:AppStyles.regular.copyWith(fontSize: 18) ,),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                        Row(
                              children: [
                                
                                CircleAvatar(
                                  radius: MediaQuery.sizeOf(context).width * .08,
                                  backgroundImage: AssetImage('assets/images/person.jpg'),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Dr.Mohamed effat", style: AppStyles.regular),
                                    Text(
                    "professor of Alergy and lmmunology",
                    style: AppStyles.regularblck.copyWith(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Text("the appointment is tomorrow at 09:00 Am",style: AppStyles.regular.copyWith(color: Colors.green,fontSize: 15),)
                    ],),
                  ),
                ),
              
              ],),
            ):Text("No Appointments"),
          );
        },
      ),
    );
  }
}
