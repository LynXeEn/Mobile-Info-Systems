import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerMap extends StatefulWidget {
  final LatLng initialPosition;

  const LocationPickerMap({
    Key? key,
    required this.initialPosition,
  }) : super(key: key);

  @override
  State<LocationPickerMap> createState() => _LocationPickerMapState();
}

class _LocationPickerMapState extends State<LocationPickerMap> {
  late LatLng _selectedPosition;
  GoogleMapController? _controller;

  @override
  void initState() {
    super.initState();
    _selectedPosition = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a Location'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _selectedPosition);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.initialPosition,
              zoom: 16,
            ),
            onMapCreated: (controller) {
              _controller = controller;
            },
            onTap: (LatLng position) {
              setState(() {
                _selectedPosition = position;
              });
            },
            markers: {
              Marker(
                markerId: const MarkerId('selected_location'),
                position: _selectedPosition,
                draggable: true,
                onDragEnd: (LatLng position) {
                  setState(() {
                    _selectedPosition = position;
                  });
                },
              ),
            },
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Coordinates:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Latitude: ${_selectedPosition.latitude.toStringAsFixed(6)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Longitude: ${_selectedPosition.longitude.toStringAsFixed(6)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
