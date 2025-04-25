import 'package:we_care/features/auth/domain/repository/repository.dart';

class RegisterUsecase {
  final AuthRepository _authRepository;

  RegisterUsecase(this._authRepository);
  Future<void>call({required String email, required String password}) async {
    return await _authRepository.Register(email: email, password: password);
  }
}