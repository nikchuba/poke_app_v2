import 'response_info.dart';

class Response<T> {
  const Response({
    required this.info,
    required this.results,
  });

  final ResponseInfo info;
  final List<T> results;
}
