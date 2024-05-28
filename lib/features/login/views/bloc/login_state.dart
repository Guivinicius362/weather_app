part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState(this.email, this.password);

  final String email;
  final String password;
}

class LoginInitial extends LoginState {
  const LoginInitial(super.email, super.password);

  @override
  List<Object> get props => [email, password];
}

class LoginLoading extends LoginState {
  const LoginLoading(super.email, super.password);

  @override
  List<Object> get props => [email, password];
}

class LoginSuccess extends LoginState {
  const LoginSuccess(super.email, super.password);

  @override
  List<Object> get props => [email, password];
}

class LoginFailure extends LoginState {
  const LoginFailure(super.email, super.password, this.error);

  final String error;

  @override
  List<Object> get props => [email, password, error];
}
