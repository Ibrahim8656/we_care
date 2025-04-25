import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';

abstract class PatientRepository{
Future<List>getPatientData();
}