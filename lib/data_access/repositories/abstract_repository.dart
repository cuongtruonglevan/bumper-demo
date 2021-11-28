part of data_access;

abstract class AbstractRepository {
  AbstractRepository();

  /// Try to restore a session so the user doesn't have to enter credentials again.
  Future<Profile> restoreSession();

  /// Signs the user in.
  Future<Profile> loginWithEmail(String email, String password);

  /// Signs the user in.
  Future<bool> loginWithPhone(String verifiedId, String smsCode);

  /// Sign out and reset the session.
  Future<void> logOut();
}
