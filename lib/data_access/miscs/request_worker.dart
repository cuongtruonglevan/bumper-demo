part of data_access;

final _kBaseUri = Uri(
  scheme: 'https',
  host: 'HOST',
  path: 'PATH',
);

class _RequestWorker {
  final BaseClient _client;

  _RequestWorker.noAuth()
      : _client = HttpClientWithInterceptor.build(
          interceptors: [_ContentTypeInterceptor()],
        );

  _RequestWorker.auth()
      : _client = HttpClientWithInterceptor.build(
          interceptors: [
            _ContentTypeInterceptor(),
            _AuthInterceptor(),
          ],
        );

  Uri _buildUrl(String path, {Map<String, String>? parameters}) {
    return Uri(
      scheme: _kBaseUri.scheme,
      host: _kBaseUri.host,
      path: '${_kBaseUri.path}/$path',
      queryParameters: parameters,
    );
  }

  Future<T> performGet<T>(
    String path, {
    required Map<String, String> parameters,
  }) =>
      _client
          .get(_buildUrl(path, parameters: parameters))
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  Future<T> performPost<T>(
    String path, {
    required Map body,
  }) =>
      _client
          .post(
            _buildUrl(path),
            body: jsonEncode(body),
          )
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  Future<T> performPut<T>(
    String path, {
    required Map body,
  }) =>
      _client
          .put(
            _buildUrl(path),
            body: jsonEncode(body),
          )
          .then((response) => _extractResponse<T>(response))
          .catchError(_handleError);

  T _extractResponse<T>(Response response) {
    if (response.statusCode == 401) {
      throw UnauthorizedAppException();
    }
    final responseBody = response.body;
    if (responseBody.isEmpty) {
      throw Exception('The response is empty');
    }
    final json = jsonDecode(responseBody);
    if (json is! Map) {
      throw AppException(
          internalMessage:
              'Invalid response format: Map was expected, but ${json.runtimeType} was received');
    } else if (!json.containsKey('data')) {
      throw AppException(
          internalMessage: 'Invalid response format: data key is not present');
    } else if (response.statusCode != 200) {
      dynamic message = json['data']['message'];
      if (message == null) {
        throw AppException(internalMessage: 'Unknown server error');
      } else {
        throw AppException(internalMessage: message.toString());
      }
    }
    return json['data'] as T;
  }

  Future<void> _handleError(dynamic exception) {
    if (exception is SocketException && exception.osError!.errorCode == 7) {
      throw AppException(
          internalMessage: exception.message,
          userFriendlyMessageUri: 'error.serverUnreachable');
    } else {
      throw exception;
    }
  }
}
