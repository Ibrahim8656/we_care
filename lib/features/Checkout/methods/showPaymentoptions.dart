import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/core/strings/constants.dart';
import 'package:we_care/features/Checkout/data/ApisKeys.dart';
import 'package:we_care/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:we_care/features/Checkout/data/callSevrice/stripe_service.dart';
import 'package:we_care/features/Checkout/presentation/cubit/checkout_cubit.dart';
import 'package:we_care/features/Checkout/presentation/screens/paymentOPtiuons.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';

void showPaymentOptions(BuildContext context, PatientEntitiy patientEntitiy) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocProvider(
          create: (context) =>
              CheckoutCubit(Paymentrepository(StripeService(SupabaseClient(supabaseurl, API_key)))),
          child: PaymentOptions(patientEntitiy: patientEntitiy,
            
          ),
        ),
      ),
    );
  }