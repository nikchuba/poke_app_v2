import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/blurred_sliver_app_bar.dart';
import 'package:rick_and_morty/libraries/ui/layout/page.dart';
import 'package:rick_and_morty/libraries/ui/layout/presenter.dart';

part 'location_page_presenter.dart';
part 'location_page_view.dart';

class LocationPage extends IScreen<LocationPagePresenter, LocationPageView> {
  LocationPage({super.key})
      : super(
          presenter: LocationPagePresenter(),
          view: const LocationPageView(),
        );
}
