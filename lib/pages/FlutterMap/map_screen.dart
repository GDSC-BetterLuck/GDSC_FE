import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:jamera/pages/FlutterMap/api.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _london = LatLng(6.125720919138062, 1.225459276314046);
  static const _paris = LatLng(6.130859109432381, 1.2180170395798313);
  static const _dublin = LatLng(6.131015, 1.223898);
  List listPoints = [];
  List<LatLng> points = [];
  getCoordinates() async {
    var response = await http.get(getRouteUrl("1.225459276314046,6.125720919138062", "1.223898,6.131015"));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listPoints = data['feattures'][0]['geometry']['coordinates'];
        points = listPoints
            .map((e) => LatLng(e[1].toDouble(), e[0].toDouble()))
            .toList();
      }
    });
  }

  static const _markers = [
    Marker(
      width: 80,
      height: 80,
      point: _london,
      child: Icon(
        Icons.location_on_sharp,
        size: 40,
        color: Colors.red,
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: _dublin,
      child: Icon(
        Icons.location_on_sharp,
        size: 40,
        color: Colors.red,
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: _paris,
      child: Icon(
        Icons.location_on_sharp,
        size: 40,
        color: Colors.red,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: MapController(),
      options: const MapOptions(
        initialCenter: LatLng(6.127622845106336, 1.2219211853927368),
        initialZoom: 20,
        maxZoom: 100,
        minZoom: 3,
        keepAlive: true,
        interactionOptions: InteractionOptions(),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          tileProvider: null,
        ),
        const MarkerLayer(markers: _markers),
        PolylineLayer(polylines: [Polyline(points: points, color: Colors.blue, strokeWidth: 4)]),
      ],
    );
  }
}
