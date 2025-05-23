import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';

abstract class AuthRepository {
  Future<void> Register({
    required String email,
    required String password,
  });
  Future<void> AddPatient({
    required PatientEntitiy patient
  });
    Future<AuthResponse> Login({
    required String email,
    required String password,
  });

}
