part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class IsLoader extends LoginEvent {
  final bool isLoaderLogin;

  const IsLoader(this.isLoaderLogin);

  @override
  List<Object> get props => [isLoaderLogin];
}