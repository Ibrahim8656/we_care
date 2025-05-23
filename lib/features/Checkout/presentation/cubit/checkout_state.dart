part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {}

final class CheckoutError extends CheckoutState {
  final String error;
  CheckoutError(this.error);
}
final class Appointmentloading extends CheckoutState {}

final class Appointmentsuccess extends CheckoutState {}

final class AppointmentError extends CheckoutState {
  final String error;
  AppointmentError(this.error);
}