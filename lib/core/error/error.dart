abstract class IError {
  const IError(String body) : _body = body;
  final String _body;

  String get message;
}

class ServerError extends IError {
  const ServerError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Server Error: ';
}

class NetworkError extends IError {
  const NetworkError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Network Error: ';
}

class CacheError extends IError {
  const CacheError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Cache Error: ';
}

class DevicePlatformError extends IError {
  const DevicePlatformError(super.body);

  @override
  String get message => _name + super._body;

  static const String _name = 'Platform Error: ';
}
