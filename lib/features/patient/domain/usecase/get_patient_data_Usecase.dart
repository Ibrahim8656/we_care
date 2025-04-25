import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/repository/repository.dart';

class GetPatientDataUsecase {
  final PatientRepository _patientRepository;

  GetPatientDataUsecase(this._patientRepository);
  Future<List >call()async{
    return await _patientRepository.getPatientData();
  }
}