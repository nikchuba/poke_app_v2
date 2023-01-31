import 'pagination_info.dart';

class Pagination<T> {
  const Pagination({
    required this.info,
    required this.results,
  });

  final PaginationInfo info;
  final List<T> results;

  Pagination<T> copyWith({PaginationInfo? info, List<T>? results}) {
    return Pagination<T>(
      info: info ?? this.info,
      results: results ?? this.results,
    );
  }
}
