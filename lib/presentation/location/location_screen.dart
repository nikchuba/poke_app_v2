import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';

part 'location_screen_presenter.dart';
part 'location_screen_view.dart';

class LocationScreen
    extends IScreen<LocationScreenPresenter, LocationScreenView> {
  LocationScreen({super.key})
      : super(
          presenter: LocationScreenPresenter(),
          view: const LocationScreenView(),
        );
}
