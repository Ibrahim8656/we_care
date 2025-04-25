import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/helpers/dio_helper/dio_helper.dart';
import 'package:we_care/core/observer/bloc_observer.dart';
import 'package:we_care/core/raouting/App_Route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/strings/constants.dart';
import 'package:we_care/features/auth/data/repository.dart';
import 'package:we_care/features/auth/domain/usecase/add_patient_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/login_usecase.dart';
import 'package:we_care/features/auth/domain/usecase/register_usecase.dart';
import 'package:we_care/features/auth/presintation/cubit/auth_cubit.dart';
import 'package:we_care/features/patient/data/repository.dart';
import 'package:we_care/features/patient/domain/usecase/get_patient_data_Usecase.dart';
import 'package:we_care/features/patient/presintation/cubit/patient_cubit.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseurl, anonKey: API_key);
  DioHelper.init();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AuthCubit(
                RegisterUsecase(AuthRepositoryImpl()),
                AddPatientUsecase(AuthRepositoryImpl()),
                LoginUsecase(AuthRepositoryImpl()),
              ),
        ),
        BlocProvider(create: (context) => PatientCubit(GetPatientDataUsecase(PatientRepositoryImpl()))..getPatientData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
