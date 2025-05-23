
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';
import 'package:we_care/features/patient/domain/repository/repository.dart';

class Makeappoinmentusecase {
  final PatientRepository patientRepository;

  Makeappoinmentusecase(this.patientRepository);
  Future<void>call(Appointment appointment) async {
    return await patientRepository.makeAppointment(appointment);
  }
}