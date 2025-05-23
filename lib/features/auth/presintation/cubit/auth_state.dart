part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthError extends AuthState {
  final String error;

  AuthError({required this.error});
  
}
final class RAuthLoading extends AuthState {}
final class RAuthSuccess extends AuthState {}
final class RAuthError extends AuthState {
  final String error;

  RAuthError({required this.error});
  
}

final class AddpatientLoading extends AuthState {}
final class AddpatientSuccess extends AuthState {}
final class AddpatientError extends AuthState {
  final String error;

  AddpatientError({required this.error});
  
}

final class LoginLoading extends AuthState {}
final class LoginSuccess extends AuthState {
  final AuthResponse authResponse;

  LoginSuccess({required this.authResponse});
}
final class LoginError extends AuthState {
  final String error;

  LoginError({required this.error});
  
}

