import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';

abstract class ILocationRepository {
  Future<ErrorOr<Pagination<Location>>> getLocations(int? page);
}
