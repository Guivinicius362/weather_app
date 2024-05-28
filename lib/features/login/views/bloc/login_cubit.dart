import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/login/controllers/login_controller.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial('', ''));

  final _loginController = GetIt.instance<LoginController>();

  void login(String email, String password) {
    emit(LoginLoading(email, password));
    _loginController.login(email, password).then((success) {
      if (success) {
        emit(LoginSuccess(email, password));
      } else {
        emit(LoginFailure(email, password, 'Login failed'));
      }
    });
  }

  void onEmailChanged(String email) {
    emit(LoginInitial(email, state.password));
  }

  void onPasswordChanged(String password) {
    emit(LoginInitial(state.email, password));
  }
}
