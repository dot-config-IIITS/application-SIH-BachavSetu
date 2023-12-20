import 'package:latlong2/latlong.dart';

class Point {
  LatLng? coordinates;
  String? type;
  double? intensity;
  double? radius;

  Point({
    this.coordinates,
    this.type,
    this.intensity,
    this.radius,
  });
}
