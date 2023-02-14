import 'package:get_it/get_it.dart';
import 'dio_container.dart' as dio_container;
import 'service_container.dart' as service_container;
import 'repository_container.dart' as repository_container;
import 'manager_container.dart' as manager_container;

final locator = GetIt.instance;

void setup() {
  dio_container.init(locator);
  service_container.init(locator);
  repository_container.init(locator);
  manager_container.init(locator);
}
