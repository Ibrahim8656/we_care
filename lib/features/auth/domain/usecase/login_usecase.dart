import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:we_care/features/auth/domain/repository/repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);
  Future<AuthResponse> call({required String email, required String password}) async {
    return await _authRepository.Login(email: email, password: password);
  }
}