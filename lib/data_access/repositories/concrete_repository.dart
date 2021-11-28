part of data_access;

class ConcreteRepository extends AbstractRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  @override
  Future<void> logOut() {
    return storeSessionData();
  }

  @override
  Future<Profile> loginWithEmail(String email, String password) {
    // TODO: implement loginWithEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithPhone(String verifiedId, String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifiedId,
        smsCode: smsCode,
      );

      final User user = (await _auth.signInWithCredential(credential)).user!;

      debugPrint("Successfully signed in UID: ${user.uid}");
      return true;
    } catch (e) {
      debugPrint("Failed to sign in: " + e.toString());
      return false;
    }
  }

  @override
  Future<Profile> restoreSession() {
    // TODO: implement restoreSession
    throw UnimplementedError();
  }
}
