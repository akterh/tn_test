class Distance {
  final int value;
  final String text;

  Distance({required this.value, required this.text});
}

class Leg {
  final Distance? distance;

  Leg({this.distance});
}

class OverviewPolyline {
  final String points;

  OverviewPolyline({required this.points});
}

class Route {
  final List<Leg>? legs;
  final OverviewPolyline? overviewPolyline;

  Route({this.legs, this.overviewPolyline});
}
