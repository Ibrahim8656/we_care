import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/auth/domain/repository/repository.dart';

class AddPatientUsecase {
  final AuthRepository _authRepository;

  AddPatientUsecase(this._authRepository);
  Future<void>call({required PatientEntitiy patient})async{
   return await _authRepository.AddPatient(patient: patient);
  }
}