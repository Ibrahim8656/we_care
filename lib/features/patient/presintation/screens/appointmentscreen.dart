import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/utils/app_styles.dart';
import 'package:we_care/features/Checkout/data/ApisKeys.dart';
import 'package:we_care/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:we_care/features/Checkout/data/callSevrice/stripe_service.dart';
import 'package:we_care/features/Checkout/presentation/cubit/checkout_cubit.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/widgets/doctorandpaywidget.dart';


class appointment_screen extends StatelessWidget {
  const appointment_screen({super.key, required this.patientEntitiy, });
 final PatientEntitiy patientEntitiy;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CheckoutCubit(Paymentrepository(StripeService(SupabaseClient(supabaseurl, API_key)) )),
      child: BlocConsumer<CheckoutCubit, CheckoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Appointment",
                style: AppStyles.regular.copyWith(
                  fontSize: 22,
                  color: Colors.black87,
                ),
              ),
            ),
            body: doctorandpay(patientEntitiy: patientEntitiy),
          );
        },
      ),
    );
  }
}

