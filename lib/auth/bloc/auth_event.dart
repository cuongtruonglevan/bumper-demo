part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class DidAuthenticate extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class LogOut extends AuthEvent {
  const LogOut();

  @override
  List<Object?> get props => [];
}

class RestoreSession extends AuthEvent {
  @override
  List<Object?> get props => [];
}
