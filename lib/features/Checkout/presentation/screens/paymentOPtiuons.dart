import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_care/core/helpers/cash_helper/shared_preferences.dart';
import 'package:we_care/core/utils/colors.dart';
import 'package:we_care/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:we_care/features/Checkout/presentation/cubit/checkout_cubit.dart';
import 'package:we_care/features/Checkout/presentation/screens/successscreen.dart';
import 'package:we_care/features/Checkout/widgets/snackbar.dart';
import 'package:we_care/features/auth/domain/entity/patient_entitiy.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({super.key, required this.patientEntitiy});
  final PatientEntitiy patientEntitiy;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select Payment Method',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildPaymentOption(Icons.credit_card, 'Credit Card'),
          _buildPaymentOption(Icons.paypal, 'PayPal'),
          _buildPaymentOption(Icons.account_balance_wallet, 'Wallet'),
          const SizedBox(height: 20),
          BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) {
              if (state is CheckoutSuccess) {
                // PatientCubit.get(context).makeAppointment(appointment);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => successscreen(Total: 1000),
                  ),
                );
              } else if (state is CheckoutError) {
                Navigator.of(context).pop();
                showSnackbar(
                  context: context,
                  message: state.error, // Lowercase 'error'
                  color: Colors.red,
                );
              }
            },
            builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  color: primaryColor, // Fixed casing
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                child: MaterialButton(
                  onPressed: () {
                    PaymentIntentInputModell paymentIntent =
                        PaymentIntentInputModell(
                          amount: '1000',
                          currency: 'USD',
                        );
                    CheckoutCubit.get(context)..makePayment(
                      paymentintent: paymentIntent, // Correct parameter name
                    );
                    var appointment = Appointment(
                      id:CashHelper.Getdata("id") ,
                      name: patientEntitiy.name,
                      age: patientEntitiy.age,
                      gender: patientEntitiy.gender,
                      address: patientEntitiy.address,
                      phone: patientEntitiy.phone,
                      job: patientEntitiy.job,
                      veisit_type: 'Follow up',
                    );
                    CheckoutCubit.get(
                      context,
                    ).makeAppointment(appointment: appointment);
                  },
                  child:
                      state is CheckoutLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(text),
      onTap: () {
        // Handle payment method selection
      },
    );
  }
}
