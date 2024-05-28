abstract class LoginController {
  Future<bool> login(String email, String password);
}

class LoginControllerImpl implements LoginController {
  LoginControllerImpl();

  @override
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}
