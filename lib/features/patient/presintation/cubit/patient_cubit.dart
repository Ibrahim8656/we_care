import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';
import 'package:we_care/features/patient/domain/usecase/getAppointments.dart';
import 'package:we_care/features/patient/domain/usecase/get_patient_data_Usecase.dart';
import 'package:we_care/features/patient/domain/usecase/makeAppoinmentusecase.dart';
import 'package:we_care/features/patient/presintation/screens/myappointmentsscreen.dart';
import 'package:we_care/features/patient/presintation/screens/notification_screen.dart';
import 'package:we_care/features/patient/presintation/screens/patient_home_screen.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  final GetPatientDataUsecase getPatientDataUsecase;
  final Makeappoinmentusecase makeappoinmentusecase;
  final Getappointmentsusecase getappointmentsusecase;
  PatientCubit(this.getPatientDataUsecase, this.makeappoinmentusecase, this.getappointmentsusecase) : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);
   
  List<PatientEntitiy> patientDataa=[];
  int currentIndex = 0;
  void changeHomescreen(int index) {
    emit(Loading());
    currentIndex = index;
    emit(PatientChangeBottomNavBar());
  }
  List<Widget>screens
  = [
    PatientHomeScreen(),
   Myappointmetns(),
   NotificationScreen()
  ];
  Future<void> getPatientData() async {
    emit(PatientLoading());
    try {
    final patientData= await getPatientDataUsecase.call();
    patientDataa= patientData;
    print("Patient data fetched successfully: ${patientDataa[0].name}");
      emit(PatientLoaded(patientData));
    }catch (e) {
      print("Error in getPatientData: $e");
      emit(PatientError(e.toString()));
    }
      // Simulate a network call or data fetching
  }
  Future<void> makeAppointment(Appointment appointment) async{
    emit(makeAppointmentLoading());
    try {
      await makeappoinmentusecase.call(appointment);
      emit(makeAppointmentSuccess());
    }catch(e){
      print("Error in makeAppointment: $e");
      emit(makeAppointmentError(e.toString()));
    }
  }
  Future<void> getAppointments() async {
    emit(getAppointmentLoading());
    try {
      final appointments = await getappointmentsusecase.call();
      emit(getAppointmentSuccess(appointments: appointments));
    } catch (e) {
      print("Error in getAppointments: $e");
      emit(getAppointmentError(e.toString()));
    }
  }
}
