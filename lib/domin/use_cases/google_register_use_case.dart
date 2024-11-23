import '../repository/repository/auth_repository.dart';

class GoogleRegisterUseCase {
  AuthRepositoryContract authRepository;

  GoogleRegisterUseCase({required this.authRepository});

  Future invoke() {
    return authRepository.registerByGoogle();
  }
}
