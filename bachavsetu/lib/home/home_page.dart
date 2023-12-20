import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bachavsetu/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:bachavsetu/login/socket_manager.dart';

import 'point.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Point> points = [];
  Timer? updateTimer;
  Position? pos;
  LatLng? tappedLocation;
  final mapController = MapController();

  @override
  void initState() {
    super.initState();
    writeLocationsToJsonFile();
    readJsonFileAndConvertToPoints();
    // addPoints(locations);
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
          size: 30.0,
        );
      case 'hospital':
        return const Icon(
          Icons.local_hospital,
          color: Colors.black,
          size: 30.0,
        );
      case 'police':
        return const Icon(
          Icons.local_police,
          color: Colors.black,
          size: 30.0,
        );
      case 'firedept':
        return const Icon(
          Icons.fire_truck,
          color: Colors.black,
          size: 30.0,
        );
      case 'accident':
        return const Icon(
          Icons.car_crash_sharp,
          color: Colors.red,
          size: 30.0,
        );
      case 'fire':
        return const Icon(
          Icons.fireplace,
          color: Colors.red,
          size: 30.0,
        );
      default:
        return const Icon(
          Icons.warning,
          color: Colors.black,
          size: 30.0,
        );
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/location.json');
  }

  void writeLocationsToJsonFile() async {
    final file = await _localFile;

    Map<String, dynamic> locations = {
      "loc1": {
        "coordinates": {
          "latitude": 16.48784010549246,
          "longitude": 80.69439348089172
        },
        "type": "relief",
        "intensity": 0.2,
        "radius": 200.0
      },
      "loc2": {
        "coordinates": {
          "latitude": 16.500015724527493,
          "longitude": 80.69160408652115
        },
        "type": "accident",
        "intensity": 0.2,
        "radius": 200.0
      },
      "loc3": {
        "coordinates": {
          "latitude": 16.475786057744276,
          "longitude": 80.7094013279649
        },
        "type": "flood",
        "intensity": 0.8,
        "radius": 400.0
      },
      "loc4": {
        "coordinates": {
          "latitude": 16.511850797545755,
          "longitude": 80.69144235326961
        },
        "type": "police",
        "intensity": 0.3,
        "radius": 200.0
      },
      "loc5": {
        "coordinates": {
          "latitude": 16.497043743566362,
          "longitude": 80.70273631514088
        },
        "type": "hospital",
        "intensity": 0.3,
        "radius": 200.0
      },
      "loc6": {
        "coordinates": {
          "latitude": 16.50742086453858,
          "longitude": 80.70579151012141
        },
        "type": "firedept",
        "intensity": 0.3,
        "radius": 200.0
      },
      "loc7": {
        "coordinates": {
          "latitude": 16.485043597365173,
          "longitude": 80.68283138971192
        },
        "type": "fire",
        "intensity": 0.3,
        "radius": 200.0
      }
    };

    Map<String, dynamic> esit = {
      "Test": {
        "name": "Test Loc",
        "coordinates": {
          "latitude": 16.485043597365173,
          "longitude": 80.68283138971192
        },
        "type": "firedept",
        "intensity": 0.3,
        "radius": 800.0
      }
    };

    await file.writeAsString(json.encode(locations));
    // await file.writeAsString(json.encode(esit));

    IO.Socket socket = SocketManager.getSocket();
    socket.on("notify_danger_site", (data) async {
      await file.writeAsString(json.encode(data));
    });
  }

  void readJsonFileAndConvertToPoints() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      Map<String, dynamic> jsonData = json.decode(contents);

      List<Point> point = [];

      jsonData.forEach((key, location) {
        Point newPoint = Point(
          coordinates: LatLng(
            location['coordinates']['latitude'],
            location['coordinates']['longitude'],
          ),
          type: location['type'],
          intensity: location['intensity'],
          radius: location['radius'],
        );

        point.add(newPoint);
      });
      // Print all points
      // points.forEach((point) {
      //   print(point.name);
      //   print(point.coordinates);
      // });
      setState(() {
        points = point;
      });
      // return points;
    } catch (e) {
      print("Error reading file: $e");
      // return [];
    }
  }

  // void addPoints(List<Map<dynamic, dynamic>> locations) {
  //   for (var location in locations) {
  //     Point newPoint = Point(
  //       name: location['name'],
  //       coordinates: LatLng(
  //         location['coordinates']['latitude'],
  //         location['coordinates']['longitude'],
  //       ),
  //       type: location['type'],
  //       intensity: location['intensity'],
  //       radius: location['radius'],
  //     );

  //     points.add(newPoint);
  //   }

  //   // If you want to update the state when adding points in a StatefulWidget
  //   // uncomment the following line
  //   // setState(() {});
  // }

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
      // pos = userLocationGetter();
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

  void getUserLocation(BuildContext context) async {
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
        forceAndroidLocationManager: true,
      );
      print(position);
      context
          .read<UserDataModel>()
          .updateLocation(position.latitude, position.longitude);
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  // Position? userLocationGetter() {
  //   requestLocationPermission().then((_) {
  //     getUserLocation();
  //   });
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    // userLocationGetter(context);
    requestLocationPermission().then((_) {
      getUserLocation(context);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Page'),
        backgroundColor: Colors.deepPurple.shade50,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      // body: Text(
      //     // "Lattitude: ${pos == null ? 0.0 : pos!.latitude}, Longitude: ${pos == null ? 0.0 : pos!.longitude}"),
      //     "Lattitude: ${context.watch<UserDataModel>().lattitude}, Longitude: ${context.watch<UserDataModel>().longitude}"),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          // initialCenter:
          // points.isNotEmpty ? points[0].coordinates! : const LatLng(0, 0),
          initialCenter: LatLng(context.read<UserDataModel>().latitude,
              context.read<UserDataModel>().longitude),
          initialZoom: 14,
          onTap: (TapPosition tapPosition, LatLng latLng) {
            // print(tapPosition);
            // print(latLng);
            setState(() {
              tappedLocation = LatLng(latLng.latitude, latLng.longitude);
            });
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/sahoobishwajeet/clq5bo7nn01zy01pacmmee3fn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
            additionalOptions: const {
              'accessToken':
                  'pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
          MarkerLayer(
            markers: [
              if (tappedLocation != null)
                Marker(
                  width: 30.0,
                  height: 30.0,
                  point: tappedLocation!,
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 50.0,
                  ),
                  rotate: true,
                ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(context.watch<UserDataModel>().latitude,
                    context.watch<UserDataModel>().longitude),
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 50.0,
                ),
                rotate: true,
              ),
            ],
          ),
          MarkerLayer(
            markers: points
                .map(
                  (point) => Marker(
                    width: 30.0,
                    height: 30.0,
                    point: point.coordinates!,
                    child: generateIcon(point.type!),
                    rotate: true,
                  ),
                )
                .toList(),
          ),
          CircleLayer(
            circles: points
                .map(
                  (point) => CircleMarker(
                    point: point.coordinates!,
                    radius: point.radius!,
                    useRadiusInMeter: true,
                    color: isGood(point.type!)
                        ? Colors.green.withOpacity(point.intensity!)
                        : generateHeatmapColor(point.intensity!)
                            .withOpacity(generateOpacity(point.intensity!)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
