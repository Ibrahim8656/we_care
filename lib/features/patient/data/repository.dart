import 'package:dio/dio.dart';
import 'package:we_care/core/helpers/dio_helper/dio_helper.dart';
import 'package:we_care/core/strings/constants.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/repository/repository.dart';

class PatientRepositoryImpl implements PatientRepository{
  @override
  Future<List> getPatientData()async {
    try{
     final Response response= await DioHelper.getData(url: 'https://rdwbrvbbdumctnnbcdwl.supabase.co/rest/v1/patients');
      if(response.statusCode==200){
        final  data=response.data;
        final List  patient=data
            .map((patientData) => PatientEntitiy.fromJson(patientData))
            .toList();
        return patient;
      }else{
        return Future.error("Error fetching patient data: ${response.statusCode}");
      }
    }catch(e){
      rethrow;
    }
  }

} 