import 'package:dio/dio.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';

abstract class AuthRepository {
  Future<void> Register({
    required String email,
    required String password,
  });
  Future<void> AddPatient({
    required PatientEntitiy patient
  });
    Future<void> Login({
    required String email,
    required String password,
  });

}
