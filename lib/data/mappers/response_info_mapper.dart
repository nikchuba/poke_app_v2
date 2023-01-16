import 'package:rick_and_morty/data/models/response_info_dto.dart';
import 'package:rick_and_morty/domain/entities/response_info.dart';

ResponseInfo mapResponseInfo(ResponseInfoDto dto) {
  return ResponseInfo(
    count: dto.count,
    pages: dto.pages,
    next: dto.next,
    prev: dto.prev,
  );
}
