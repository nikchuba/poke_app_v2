import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rick_and_morty/domain/entities/location.dart';

import 'location_widget.dart';

class LocationsGridView extends StatelessWidget {
  const LocationsGridView({Key? key, required this.locations})
      : super(key: key);

  final Set<Location> locations;

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.extent(
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      maxCrossAxisExtent: 450,
      children: [
        ...locations.map(
          (location) => LocationWidget(
            location: location,
            theme: Theme.of(context),
          ),
        )
      ],
    );
  }
}
