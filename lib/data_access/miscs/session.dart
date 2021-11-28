part of data_access;

Future<SessionData> getSessionData() async {
  final dataString = '';
  return SessionData.fromJson(jsonDecode(dataString) as Map<String, dynamic>);
}

Future<void> storeSessionData({SessionData? data}) async {
  debugPrint(data!.accessToken);
}
