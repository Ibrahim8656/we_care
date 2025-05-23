import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';
import 'package:we_care/features/patient/domain/repository/repository.dart';

class Getappointmentsusecase {
  final PatientRepository patientRepository;

  Getappointmentsusecase(this.patientRepository);
  Future<List<Appointment>> call() async {
    try {
      final appointments = await patientRepository.getAppointments();
      return appointments;
    } catch (e) {
      print("Error in getAppointments: $e");
      throw Exception('Failed to fetch appointments');
    }
  }
}