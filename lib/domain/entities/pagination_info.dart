class PaginationInfo {
  const PaginationInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final Uri? next;
  final Uri? prev;

  int? get nextPage => _getPageNumberFromUrl(next);
  int? get prevPage => _getPageNumberFromUrl(prev);

  int? _getPageNumberFromUrl(Uri? uri) {
    final page = uri?.queryParameters['page']!;
    return page != null ? int.parse(page) : null;
  }
}
