abstract class IException implements Exception {
  IException(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

class ServerException extends IException {
  ServerException(super.message);
}

class CacheException extends IException {
  CacheException(super.message);
}

class DevicePlatformException extends IException {
  DevicePlatformException(super.message);
}
