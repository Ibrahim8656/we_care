import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/helpers/cash_helper/shared_preferences.dart';
import 'package:we_care/core/helpers/dio_helper/dio_helper.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';
import 'package:we_care/features/patient/domain/repository/repository.dart';

class PatientRepositoryImpl implements PatientRepository{
  final SupabaseClient _supabaseClient;

  PatientRepositoryImpl(this._supabaseClient);
  @override
  @override
Future<List<PatientEntitiy>> getPatientData() async {
  try {
    final Response response = await DioHelper.getData(
      url: 'https://rdwbrvbbdumctnnbcdwl.supabase.co/rest/v1/patients?id=eq.${CashHelper.Getdata("id")}',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final List<PatientEntitiy> patients = data
          .map((patientData) => PatientEntitiy.fromJson(patientData))
          .toList();

      if (patients.isNotEmpty) {
        return patients;
      } else {
        return Future.error('No patient data found');
      }
    } else {
      return Future.error("Error fetching patient data: ${response.statusCode}");
    }
  } catch (e) {
    rethrow;
  }
}

  
  @override
 Future<void> makeAppointment(Appointment appointment) async {
    try {
      final Map<String, dynamic> Appointment_dada = appointment.toMap();
      final response =
          await _supabaseClient
              .from('appointments')
              .insert([Appointment_dada]) // Insert the patient data
              .select()
              .single();
      if (response.isEmpty) {
        print("nodata");
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to make appointment');
    }
  }
  
  @override
  Future<List<Appointment>> getAppointments() async{
 try {
    final Response response = await DioHelper.getData(
      url: 'https://rdwbrvbbdumctnnbcdwl.supabase.co/rest/v1/appointments?id=eq.${CashHelper.Getdata("id")}',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final List<Appointment> appointment = data
          .map((appointmentdata) => Appointment.fromMap(appointmentdata))
          .toList();

      if (appointment.isNotEmpty) {
        return appointment;
      } else {
        return Future.error('No appointments found');
      }
    } else {
      return Future.error("Error fetching appointments: ${response.statusCode}");
    }
  } catch (e) {
    rethrow;
  }
  }

} 