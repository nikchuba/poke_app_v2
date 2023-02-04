class PaginationInfo {
  const PaginationInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  int? get nextPage => _getPageNumberFromUrl(next);
  int? get prevPage => _getPageNumberFromUrl(prev);

  int? _getPageNumberFromUrl(String? url) {
    if (url == null) return null;
    final uri = _getUri(url);
    final page = uri.queryParameters['page']!;
    return int.parse(page);
  }

  Uri _getUri(String url) => Uri.parse(url);
}
