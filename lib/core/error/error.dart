abstract class IError {
  const IError(this.body);
  final String body;
}

class ServerError extends IError {
  const ServerError(super.body);

  String get message => _name + super.body;

  static const String _name = 'Server Error: ';
}

class CacheError extends IError {
  const CacheError(super.body);

  String get message => _name + super.body;

  static const String _name = 'Cache Error: ';
}

class DevicePlatformError extends IError {
  const DevicePlatformError(super.body);

  String get message => _name + super.body;

  static const String _name = 'Platform Error: ';
}
