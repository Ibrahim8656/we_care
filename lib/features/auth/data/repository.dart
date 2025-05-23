
import 'package:we_care/core/helpers/cash_helper/shared_preferences.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/auth/domain/repository/repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _supabaseClient = Supabase.instance.client;
  
  @override
   Future<void> AddPatient({ required PatientEntitiy patient}) async {
    try {
      final Map<String, dynamic> patientData = patient.Tomap();
      final response =
          await _supabaseClient
              .from('patients')
              .insert([patientData]) // Insert the patient data
              .select()
              .single();

      if (response.isEmpty) {
        print('Error: Failed to add patient');
        throw Exception('Failed to add patient');
      } else {
        print('Patient added successfully');
        print(
          response.entries.first.value.toString(),
        ); // Print the inserted data (optional)
      }
    } catch (e) {
      print("Error during insert: $e");
      
    }
  }


  @override
  Future<void> Register({required String email, required String password}) async{
   
     try {
      final response = await _supabaseClient.auth.signUp(
        password:password,
        email: email,
      );
      
      print("registered");
      print(response.user!.id);
      CashHelper.SaveData("id", response.user!.id);
    } catch (e) {
      
      Exception("Error adding patient: $e");
    }
  }
    @override
  Future<AuthResponse> Login({required String email, required String password}) async {
  try {
    final AuthResponse response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      print("ID: ${response.user!.id}");
      await CashHelper.SaveData("id", response.user!.id);
      print(CashHelper.Getdata("id"));
      return response;
    } else {
      throw Exception("Error logging in user: user is null");
    }
  } catch (e) {
    print("Error logging in user: $e");
    rethrow;
  }
}

   }

