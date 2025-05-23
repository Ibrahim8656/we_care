import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:we_care/core/helpers/cash_helper/shared_preferences.dart';
import 'package:we_care/core/helpers/dio_helper/dio_helper.dart';
import 'package:we_care/core/observer/bloc_observer.dart';
import 'package:we_care/core/raouting/App_Route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/features/Checkout/data/ApisKeys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = await Apiskeys.publishableKey;
  Bloc.observer = MyBlocObserver();
  await Supabase.initialize(url: supabaseurl, anonKey: API_key);
  await CashHelper.init();

  DioHelper.init();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
         
        )
      ),
      title: 'Flutter Demo',
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
