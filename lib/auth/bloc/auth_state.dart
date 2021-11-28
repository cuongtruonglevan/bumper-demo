part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  final Profile user;

  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class UnAuthenticated extends AuthState {}

class ProfileIncomplete extends AuthState {}

class UnknownState extends AuthState {}
