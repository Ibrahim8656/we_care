
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show SupabaseClient;
import 'package:we_care/core/helpers/dio_helper/dio_helper.dart';
import 'package:we_care/core/strings/constants.dart';
import 'package:we_care/features/Checkout/data/ApisKeys.dart';
import 'package:we_care/features/Checkout/data/Stripe_models/paymentIntentModele.dart';
import 'package:we_care/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';


class StripeService{
    final SupabaseClient _supabaseClient;

  StripeService(this._supabaseClient);
Future<PaymentIntentModel >CreatePaymentIntent(PaymentIntentInputModell PaymentintentInpoutmodel)async{
  var response =await DioHelper.postdata(Url:"https://api.stripe.com/v1/payment_intents" ,
  data:PaymentintentInpoutmodel.toJson() ,
  Content_Type:Headers.formUrlEncodedContentType,
  token:'Bearer ${Apiskeys.secretkey}');

  var paymentIntentModele =PaymentIntentModel.fromJson(response.data);
  return paymentIntentModele;
}

Future Initpaymentsheet({required String paymentIntentClientSecret})async{
  await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
    paymentIntentClientSecret: paymentIntentClientSecret,
    merchantDisplayName: "Ibrahim"
  ));
}
Future DisplayPaymentSheet()async{
 await Stripe.instance.presentPaymentSheet();
}
 Future MakePayment({required PaymentIntentInputModell PaymentintentInpoutmodel})async{
  PaymentIntentModel  paymentIntentModele=await CreatePaymentIntent(PaymentintentInpoutmodel);
  await Initpaymentsheet(paymentIntentClientSecret: paymentIntentModele.clientSecret);
  await DisplayPaymentSheet();
}
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
}