abstract class IError {
  const IError({
    required this.message,
  });
  final String message;
}

class ServerError extends IError {
  const ServerError({required super.message});
}

class CacheError extends IError {
  const CacheError({required super.message});
}

class DevicePlatformError extends IError {
  const DevicePlatformError({required super.message});
}
