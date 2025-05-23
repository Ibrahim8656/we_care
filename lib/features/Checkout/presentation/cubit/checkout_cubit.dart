import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:we_care/features/Checkout/data/PaymentRepository/paymentRepository.dart';
import 'package:we_care/features/Checkout/data/Stripe_models/payment_intent_input_model.dart';
import 'package:we_care/features/patient/domain/entity/appointmentmodel.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.paymentRepository) : super(CheckoutInitial());
  final Paymentrepository paymentRepository;

  static CheckoutCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment({
    required  PaymentIntentInputModell paymentintent,
  }) async {
    emit(CheckoutLoading());
    try {
      final data = await paymentRepository.Makepayment(
      paymentintent: paymentintent
      );
      data.fold(
        (l) => emit(CheckoutError(l.Error)),
        (r) {
          emit(CheckoutSuccess());
        }
      );
    } catch (error) {
      emit(CheckoutError(error.toString()));
    }
  }
  Future<void>makeAppointment({required Appointment appointment})async{
    emit(Appointmentloading());
    try{
      await paymentRepository.makeAppointment(appointment);
      emit(Appointmentsuccess());
    }catch(e){
      print(e.toString());
      
      emit(AppointmentError(e.toString()));
      throw Exception('Failed to make appointment');
    }
  }
}