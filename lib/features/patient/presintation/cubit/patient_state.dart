part of 'patient_cubit.dart';

@immutable
sealed class PatientState {}

final class PatientInitial extends PatientState {}
final class PatientLoading extends PatientState {}
final class PatientLoaded extends PatientState {
  final  List  patientData;

  PatientLoaded(this.patientData);
}
final class PatientError extends PatientState {
  final String error;

  PatientError(this.error);
}
final class PatientChangeBottomNavBar extends PatientState {}