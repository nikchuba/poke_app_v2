import 'package:rick_and_morty/core/repository_helper.dart';
import 'package:rick_and_morty/core/typedef/either.dart';
import 'package:rick_and_morty/data/data_sources/remote/rest_api/location_service.dart';
import 'package:rick_and_morty/data/mappers/location_mapper.dart';
import 'package:rick_and_morty/domain/entities/pagination.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';

class LocationRepository with RepositoryHelper implements ILocationRepository {
  const LocationRepository({
    required LocationService service,
  }) : _service = service;

  final LocationService _service;

  @override
  Future<ErrorOr<Pagination<Location>>> getLocations(int? page) {
    return requestParser(
      request: () => _service.getLocations(page),
      parser: mapLocationResponse,
    );
  }
}
