import 'package:we_care/features/auth/domain/repository/repository.dart';

class LoginUsecase {
  final AuthRepository _authRepository;

  LoginUsecase(this._authRepository);
  Future<void> call({required String email, required String password}) async {
     await _authRepository.Login(email: email, password: password);
  }
}