import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'location.dart';
import 'point.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:path/path.dart' as p;
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Point> points = [];
  Timer? updateTimer;

  @override
  void initState() {
    super.initState();
    startUpdateTimer();
    readLocationsFile();
    // updatePoints(locations);
  }

  @override
  void dispose() {
    updateTimer?.cancel();
    super.dispose();
  }

  Future<void> readLocationsFile() async {
    try {
      final String currentDir = Directory.current.path;
      final String filePath = p.join(currentDir, 'location.dart');

      final File file = File(filePath);
      final String contents = await file.readAsString();
      final List<Map<dynamic, dynamic>> updatedLocations =
          json.decode(contents);

      print(updatedLocations);

      updatePoints(updatedLocations);
    } catch (e) {
      print('Error reading locations file: $e');
    }
  }

  Color generateHeatmapColor(double intensity) {
    intensity = intensity.clamp(0.0, 1.0);

    double hue = (1.0 - intensity) * 60.0;
    HSLColor hslColor = HSLColor.fromAHSL(1.0, hue, 1.0, 0.5);

    return hslColor.toColor();
  }

  double generateOpacity(double intensity) {
    return intensity > 0.5 ? intensity * 0.5 : intensity;
  }

  bool isGood(String type) {
    return type == 'relief' ||
        type == 'hospital' ||
        type == 'police' ||
        type == 'firedept';
  }

  Icon generateIcon(String type) {
    switch (type) {
      case 'relief':
        return const Icon(
          Icons.house,
          color: Colors.black,
        );
      case 'hospital':
        return const Icon(
          Icons.local_hospital,
          color: Colors.black,
        );
      case 'police':
        return const Icon(
          Icons.local_police,
          color: Colors.black,
        );
      case 'firedept':
        return const Icon(
          Icons.fire_truck,
          color: Colors.black,
        );
      case 'accident':
        return const Icon(
          Icons.car_crash_sharp,
          color: Colors.red,
        );
      case 'fire':
        return const Icon(
          Icons.fireplace,
          color: Colors.red,
        );
      default:
        return const Icon(
          Icons.warning,
          color: Colors.black,
        );
    }
  }

  void addPoint(Map<dynamic, dynamic> location, List<Point> listToUpdate) {
    Point newPoint = Point(
      name: location['name'],
      coordinates: LatLng(
        location['coordinates']['latitude'],
        location['coordinates']['longitude'],
      ),
      type: location['type'],
      intensity: location['intensity'],
      radius: location['radius'],
    );

    setState(() {
      listToUpdate.add(newPoint);
    });
  }

  void removePoint(Point point) {
    setState(() {
      points.remove(point);
    });
  }

  void startUpdateTimer() {
    updateTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      // updatePoints(locations);
    });
  }

  void updatePoints(List<Map<dynamic, dynamic>> updatedLocations) {
    List<Point> newPoints = [];

    for (var location in updatedLocations) {
      addPoint(location, newPoints);
    }

    setState(() {
      points = newPoints;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: const Text('Testing'),
      //   body: FlutterMap(
      //     options: MapOptions(
      //       initialCenter:
      //           points.isNotEmpty ? points[0].coordinates! : const LatLng(0, 0),
      //       initialZoom: 14,
      //     ),
      //     children: [
      //       TileLayer(
      //         urlTemplate:
      //             'https://api.mapbox.com/styles/v1/sahoobishwajeet/clq5bo7nn01zy01pacmmee3fn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
      //         additionalOptions: const {
      //           'accessToken':
      //               'pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
      //           'id': 'mapbox.mapbox-streets-v8'
      //         },
      //       ),
      //       MarkerLayer(
      //         markers: points
      //             .map(
      //               (point) => Marker(
      //                 width: 30.0,
      //                 height: 30.0,
      //                 point: point.coordinates!,
      //                 child: generateIcon(point.type!),
      //                 rotate: true,
      //               ),
      //             )
      //             .toList(),
      //       ),
      //       CircleLayer(
      //         circles: points
      //             .map(
      //               (point) => CircleMarker(
      //                 point: point.coordinates!,
      //                 radius: point.radius!,
      //                 useRadiusInMeter: true,
      //                 color: isGood(point.type!)
      //                     ? Colors.green.withOpacity(point.intensity!)
      //                     : generateHeatmapColor(point.intensity!)
      //                         .withOpacity(generateOpacity(point.intensity!)),
      //               ),
      //             )
      //             .toList(),
      //       ),
      //     ],
      //   ),
    );
  }
}
