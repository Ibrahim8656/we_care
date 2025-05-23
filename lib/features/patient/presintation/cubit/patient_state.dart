part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}
final class PatientLoading extends PatientState {}
final class PatientLoaded extends PatientState {
  final  List<PatientEntitiy>  patientData;

  PatientLoaded(this.patientData);
}
final class PatientError extends PatientState {
  final String error;

  PatientError(this.error);
}
final class PatientChangeBottomNavBar extends PatientState {}
final class Loading extends PatientState {}

final class makeAppointmentLoading extends PatientState {}
final class makeAppointmentSuccess extends PatientState {}
final class makeAppointmentError extends PatientState {
  final  String  error;

  makeAppointmentError(this.error);
}
final class getAppointmentLoading extends PatientState {}
final class getAppointmentSuccess extends PatientState {
  final  List<Appointment>  appointments;

  getAppointmentSuccess({required this.appointments});
}
final class getAppointmentError extends PatientState {
  final  String  error;

  getAppointmentError(this.error);
}