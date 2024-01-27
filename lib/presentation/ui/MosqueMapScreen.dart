import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/Mosque.dart';

class MosqueMapScreen extends StatefulWidget {
  final List<Mosque> mosques;
  final LatLng initialLocation;

  const MosqueMapScreen(
      {Key? key, required this.mosques, required this.initialLocation})
      : super(key: key);

  @override
  _MosqueMapScreenState createState() => _MosqueMapScreenState();
}

class _MosqueMapScreenState extends State<MosqueMapScreen> {
  late MapboxMapController mapController;
  Map<String, Mosque> symbolIdToMosqueMap = {};

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    mapController.animateCamera(CameraUpdate.newLatLng(widget.initialLocation));
    _addMosqueSymbols();
    _addInitialLocationSymbol();
  }

  void _addMosqueSymbols() {
    widget.mosques.forEach((mosque) async {
      var symbol = await mapController.addSymbol(SymbolOptions(
        geometry: LatLng(
          mosque.masjidLocation!.coordinates![1],
          mosque.masjidLocation!.coordinates![0],
        ),
        iconSize: 0.5,
        // this icon from mapbox example
        iconImage: "ar-national-2",
      ));

      symbolIdToMosqueMap[symbol.id] = mosque;
    });

    mapController.onSymbolTapped.add((symbol) {
      // Retrieve the mosque object based on symbol id
      Mosque? mosque = symbolIdToMosqueMap[symbol.id];
      if (mosque != null) {
        _onMosqueTapped(mosque);
      }
    });
  }

  void _addInitialLocationSymbol() {
    mapController.addSymbol(SymbolOptions(
      geometry: widget.initialLocation,
      iconSize: 0.5,
      // this icon from mapbox example
      iconImage: "ar-national-2",
    ));
  }

  void _onMosqueTapped(Mosque mosque) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(mosque.masjidName ?? "Unknown Mosque"),
        content: Text("Address: ${mosque.masjidAddress?.street ?? 'N/A'}"),
        actions: <Widget>[
          TextButton(
            child: const Text("Open in Google Maps"),
            onPressed: () {
              var url =
                  'https://www.google.com/maps/search/?api=1&query=${mosque.masjidLocation!.coordinates![1]},${mosque.masjidLocation!.coordinates![0]}';
              _launchURL(url);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        accessToken: dotenv.env['MAPBOX_ACCESS_TOKEN'] ?? '',
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.initialLocation,
          zoom: 14.0,
        ),
        styleString: dotenv.env['MAPBOX_STYLE_STRING'] ?? '',
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
