import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? _position;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    final status = await Permission.location.request();
    if (status.isGranted) _startTracking();
  }

  void _startTracking() {
    _timer = Timer.periodic(Duration(seconds: 3), (_) async {
      try {
        final pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        setState(() => _position = pos);
      } catch (e) {
        // ignore errors quietly
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // NOTE: mapping from GPS to image coordinates requires calibrating lat/lng corners.
  // For demo we show a dot if position exists.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carte - localisation')),
      body: Stack(
        children: [
          Center(child: Image.asset('assets/phantasialand_map.png', fit: BoxFit.contain)),
          if (_position != null) Positioned(
            left: 100, // TODO: compute from lat/lng -> x
            top: 200,
            child: Icon(Icons.location_on, size: 36, color: Colors.redAccent),
          ),
          Positioned(
            bottom: 16, left: 16, right: 16,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Text(_position != null ? 'Lat: \${_position!.latitude.toStringAsFixed(5)}\nLng: \${_position!.longitude.toStringAsFixed(5)}' : 'Localisation en attente...'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
