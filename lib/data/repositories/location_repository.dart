import 'package:rick_and_morty/data/data_sources/remote/rest_api/location_service.dart';
import 'package:rick_and_morty/domain/repositories/location_repository.dart';

class LocationRepository implements ILocationRepository {
  const LocationRepository({required this.service});

  final LocationService service;
}
