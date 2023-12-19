import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'location.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

import 'point.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Point> points = [];
  Timer? updateTimer;
  Position? pos;

  @override
  void initState() {
    super.initState();
    startUpdateTimer();
    // readLocationsFile();
    // updatePoints(locations);
  }

  // @override
  // void dispose() {
  //   updateTimer?.cancel();
  //   super.dispose();
  // }

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

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/location.txt');
  }

  Future<File> writeCounter(String counter) async {
    final file = await _localFile;
    // Write the file
    // return file.writeAsBytes
    return file.writeAsString('$counter');
  }
  // void addPoint(Map<dynamic, dynamic> location, List<Point> listToUpdate) {
  //   Point newPoint = Point(
  //     name: location['name'],
  //     coordinates: LatLng(
  //       location['coordinates']['latitude'],
  //       location['coordinates']['longitude'],
  //     ),
  //     type: location['type'],
  //     intensity: location['intensity'],
  //     radius: location['radius'],
  //   );

  //   setState(() {
  //     listToUpdate.add(newPoint);
  //   });
  // }

  // void removePoint(Point point) {
  //   setState(() {
  //     points.remove(point);
  //   });
  // }

  void startUpdateTimer() {
    updateTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      pos = userLocationGetter();
      // print("Timer");
    });
  }

  Future<void> requestLocationPermission() async {
    try {
      var status = await Permission.location.status;
      if (status.isGranted) {
        return;
      }

      var result = await Permission.location.request();

      if (result.isGranted) {
        return;
      } else if (result.isPermanentlyDenied) {
        openAppSettings();
      } else {
        throw 'Location permission is denied.';
      }
    } catch (e) {
      print('Error requesting location permission: $e');
    }
  }

  Future<Position?> getUserLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permission is denied.';
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print(position);
      return position;
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  Position? userLocationGetter() {
    requestLocationPermission().then((_) {
      getUserLocation().then((position) {
        // print(
        // "Lattitude:${position!.latitude}, Longitude:${position.longitude}");
        return position;
      });
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // userLocationGetter(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepPurple.shade50,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: Text(
          "Lattitude: ${pos == null ? 0.0 : pos!.latitude}, Longitude: ${pos == null ? 0.0 : pos!.longitude}"),
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
