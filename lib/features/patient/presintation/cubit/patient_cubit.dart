import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/usecase/get_patient_data_Usecase.dart';
import 'package:we_care/features/patient/presintation/screens/chats.dart';
import 'package:we_care/features/patient/presintation/screens/notification_screen.dart';
import 'package:we_care/features/patient/presintation/screens/patient_home_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final GetPatientDataUsecase getPatientDataUsecase;
  PatientCubit(this.getPatientDataUsecase) : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeHomescreen(int index) {
    currentIndex = index;
    emit(PatientChangeBottomNavBar());
  }
  List<Widget>screens
  = [
    PatientHomeScreen(),
   chatsScreen(),
   NotificationScreen()
  ];
  Future<void> getPatientData() async {
    emit(PatientLoading());
    try {
    final patientData= await getPatientDataUsecase.call();
      emit(PatientLoaded(patientData));
    }catch (e) {
      print("Error in getPatientData: $e");
      emit(PatientError(e.toString()));
    }
      // Simulate a network call or data fetching
  }
}
