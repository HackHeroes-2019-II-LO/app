enum HPTabType {
  chatView,
  mapView,
  discoverView,
}

typedef HPTabSelector = void Function(HPTabType);
