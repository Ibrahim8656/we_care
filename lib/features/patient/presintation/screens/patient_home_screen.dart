import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is PatientLoaded) {}
      },
      builder: (context, state) {
        return BlocConsumer<PatientCubit, PatientState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Scaffold(
              body:Center(
                    child: Text(
                      state is PatientLoaded ? state.patientData[1].address : "data",
                    ),
                  )
            );
          },
        );
      },
    );
  }
}
