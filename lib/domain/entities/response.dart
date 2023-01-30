import 'response_info.dart';

class Response<T> {
  const Response({
    required this.info,
    required this.results,
  });

  final ResponseInfo info;
  final List<T> results;

  Response<T> copyWith({ResponseInfo? info, List<T>? results}) {
    return Response<T>(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }
}
