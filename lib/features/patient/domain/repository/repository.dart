import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';

abstract class PatientRepository{
Future<List<PatientEntitiy>>getPatientData();
  Future<void> makeAppointment(Appointment appointment);
  Future<List<Appointment>> getAppointments();
}