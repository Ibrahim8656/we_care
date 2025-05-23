import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/helpers/cash_helper/shared_preferences.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/auth/domain/usecase/add_patient_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/login_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/register_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUsecase registerUsecase;
  final AddPatientUsecase addPatientUsecase;
  final LoginUsecase loginUsecase;
  AuthCubit(this.registerUsecase, this.addPatientUsecase, this.loginUsecase)
    : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  Future<void> Register({
    required String email,
    required String password,
  }) async {
    emit(
      RAuthLoading());
    try {
      await registerUsecase.call(email: email, password: password);
     
      emit(RAuthSuccess());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> AddPatient({
  
    required String name,
    required String phone,
    required String job,
    required String address,
    required int age,
    required String gender,
 
  }) async {
    emit(AddpatientLoading());
    try {
      final patient = PatientEntitiy(
   
        name: name,
        phone: phone,
        address: address,
        job:job,
        age: age,
        gender: gender, id: CashHelper.Getdata("id"),
 
      );
      await addPatientUsecase.call(patient: patient);
      print("AddPatient Success handledddddddddddddddd");
      emit(AddpatientSuccess());
    } catch (e) {
      print("Error in AddPatient: $e");
      emit(AddpatientError(error: e.toString()));
    }
  }
  Future<void> Login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
     final authResponse=  await loginUsecase.call(email: email, password: password);
        emit(LoginSuccess(authResponse: authResponse));
      
    } catch (e) {
      emit(LoginError(error: e.toString()));
      rethrow;
      
    }
  }
}
