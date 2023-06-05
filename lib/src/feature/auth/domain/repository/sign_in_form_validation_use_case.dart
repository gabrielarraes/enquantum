abstract class SignInFormValidationUseCase {
  bool validateUsername(String username);
  bool validatePassword(String password);
  Future<dynamic> signIn(String username, String password);
}