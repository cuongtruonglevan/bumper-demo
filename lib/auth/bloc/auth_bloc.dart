import 'package:bumper_demo/model/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(UnknownState()) {
    add(RestoreSession());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RestoreSession) {
      yield* _mapRestoreSessionEventToState();
    } else if (event is DidAuthenticate) {
      yield* _mapDidAuthenticateEventToState();
    } else if (event is LogOut) {
      yield* _mapLogOutEventToState();
    }
  }

  Stream<AuthState> _mapRestoreSessionEventToState() async* {
    final authenticated =
        await Future.delayed(const Duration(milliseconds: 2000), () => true);
    if (authenticated) {
      final json = <String, dynamic>{};
      final user = Profile.fromJson(json);
      yield Authenticated(user);
    } else {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> _mapDidAuthenticateEventToState() async* {
    final json = <String, dynamic>{};
    final user = Profile.fromJson(json);
    if (user.profileCompleted) {
      yield Authenticated(user);
    } else {
      yield ProfileIncomplete();
    }
  }

  Stream<AuthState> _mapLogOutEventToState() async* {
    yield UnAuthenticated();
  }
}
