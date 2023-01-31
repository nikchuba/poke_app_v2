import 'package:rick_and_morty/data/models/response_info_dto.dart';
import 'package:rick_and_morty/domain/entities/pagination_info.dart';

PaginationInfo mapResponseInfo(ResponseInfoDto dto) {
  return PaginationInfo(
    count: dto.count,
    pages: dto.pages,
    next: dto.next,
    prev: dto.prev,
  );
}
