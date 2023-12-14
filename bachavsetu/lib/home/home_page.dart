import 'dart:ffi';

import 'package:flutter/material.dart';
import 'location.dart';
import 'point.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Point point1 = Point(
    name: locations[0]['name'],
    coordinates: LatLng(
      locations[0]['coordinates']['latitude'],
      locations[0]['coordinates']['longitude'],
    ),
    type: locations[0]['type'],
    intensity: locations[0]['intensity'],
    radius: locations[0]['radius'],
  );

  Point point2 = Point(
    name: locations[1]['name'],
    coordinates: LatLng(
      locations[1]['coordinates']['latitude'],
      locations[1]['coordinates']['longitude'],
    ),
    type: locations[1]['type'],
    intensity: locations[1]['intensity'],
    radius: locations[1]['radius'],
  );

  Point point3 = Point(
    name: locations[2]['name'],
    coordinates: LatLng(
      locations[2]['coordinates']['latitude'],
      locations[2]['coordinates']['longitude'],
    ),
    type: locations[2]['type'],
    intensity: locations[2]['intensity'],
    radius: locations[2]['radius'],
  );

  Point point4 = Point(
    name: locations[3]['name'],
    coordinates: LatLng(
      locations[3]['coordinates']['latitude'],
      locations[3]['coordinates']['longitude'],
    ),
    type: locations[3]['type'],
    intensity: locations[3]['intensity'],
    radius: locations[3]['radius'],
  );

  @override
  Color generateHeatmapColor(double intensity) {
    intensity = intensity.clamp(0.0, 1.0);

    double hue = (1.0 - intensity) * 60.0;
    HSLColor hslColor = HSLColor.fromAHSL(1.0, hue, 1.0, 0.5);

    return hslColor.toColor();
  }

  double generateOpacity(double intensity) {
    return intensity > 0.5 ? intensity * 0.5 : intensity;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.deepPurple.shade50,
      ),
      backgroundColor: Colors.deepPurple.shade100,
      body: FlutterMap(
        options: MapOptions(
          initialCenter: point1.coordinates!,
          initialZoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://api.mapbox.com/styles/v1/sahoobishwajeet/clq5bo7nn01zy01pacmmee3fn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
            // userAgentPackageName: 'com.example.app',
            additionalOptions: const {
              'accessToken':
                  'pk.eyJ1Ijoic2Fob29iaXNod2FqZWV0IiwiYSI6ImNscTR6Z3ppMTBjMXAyamxoMTJnbjQ1YzYifQ.x8UbjrT3ExtQ6lrbxZDM4w',
              'id': 'mapbox.mapbox-streets-v8'
            },
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 30.0,
                height: 30.0,
                point: point1.coordinates!,
                child: Icon(
                  Icons.location_on,
                  color: point1.type == 'relief' ? Colors.green : Colors.red,
                ),
                rotate: true,
              ),
              Marker(
                width: 30.0,
                height: 30.0,
                point: point2.coordinates!,
                child: Icon(
                  Icons.location_on,
                  color: point2.type == 'relief' ? Colors.green : Colors.red,
                ),
                rotate: true,
              ),
              Marker(
                width: 30.0,
                height: 30.0,
                point: point3.coordinates!,
                child: Icon(
                  Icons.location_on,
                  color: point3.type == 'relief' ? Colors.green : Colors.red,
                ),
                rotate: true,
              ),
              Marker(
                width: 30.0,
                height: 30.0,
                point: point4.coordinates!,
                child: Icon(
                  Icons.location_on,
                  color: point4.type == 'relief' ? Colors.green : Colors.red,
                ),
                rotate: true,
              ),
            ],
          ),
          CircleLayer(
            circles: [
              CircleMarker(
                point: point1.coordinates!,
                radius: point1.radius!,
                useRadiusInMeter: true,
                color: generateHeatmapColor(point1.intensity!)
                    .withOpacity(generateOpacity(point1.intensity!)),
              ),
              CircleMarker(
                point: point2.coordinates!,
                radius: point2.radius!,
                useRadiusInMeter: true,
                color: generateHeatmapColor(point2.intensity!)
                    .withOpacity(generateOpacity(point2.intensity!)),
              ),
              CircleMarker(
                point: point3.coordinates!,
                radius: point3.radius!,
                useRadiusInMeter: true,
                color: generateHeatmapColor(point3.intensity!)
                    .withOpacity(generateOpacity(point3.intensity!)),
              ),
              CircleMarker(
                point: point4.coordinates!,
                radius: point4.radius!,
                useRadiusInMeter: true,
                color: generateHeatmapColor(point4.intensity!)
                    .withOpacity(generateOpacity(point4.intensity!)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
