import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/domain/entities/location.dart';
import 'package:rick_and_morty/internal/di/locator.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';
import 'package:rick_and_morty/libraries/ui/widgets/loading_indicator.dart';
import 'package:rick_and_morty/managers/location_manager.dart';
import 'package:rick_and_morty/presentation/location/widgets/locations_grid_view.dart';
import 'package:rxdart/rxdart.dart';

part 'locations_screen_presenter.dart';
part 'locations_screen_view.dart';

class LocationsScreen
    extends IScreen<LocationsScreenPresenter, LocationsScreenView> {
  LocationsScreen({super.key})
      : super(
          presenter: LocationsScreenPresenter(
            manager: locator.get(),
          )..init(),
          view: const LocationsScreenView(),
        );
}
