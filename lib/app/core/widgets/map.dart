import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OsmImplemetation extends StatefulWidget {
  const OsmImplemetation({
    super.key,
  });

  @override
  State<OsmImplemetation> createState() => _OSMState();
}

class _OSMState extends State<OsmImplemetation> {
  MapController mapController = MapController(
    initPosition: GeoPoint(
      latitude: -10.1689,
      longitude: -48.3317,
    ),
    areaLimit: const BoundingBox(
      east: -45.54,
      north: -4.91,
      south: -13.60,
      west: -50.98,
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        mapController;
      },
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: sizeWidth,
          height: sizeHeight * 0.8,
          child: OSMFlutter(
            controller: mapController,
            osmOption: const OSMOption(),
          ),
        ),
      ),
    );
  }
}
