import 'package:latlong2/latlong.dart';

class Point {
  String? name;
  LatLng? coordinates;
  String? type;
  double? intensity;
  double? radius;

  Point({
    this.name,
    this.coordinates,
    this.type,
    this.intensity,
    this.radius,
  });
}
