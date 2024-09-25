import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/json_read.dart';

class OsmImplemetation extends StatefulWidget {
  const OsmImplemetation({
    super.key,
  });

  @override
  State<OsmImplemetation> createState() => _OSMState();
}

class _OSMState extends State<OsmImplemetation> {
  late final MapController mapController;
  Map<String, dynamic> tocantinsMap = {};

  @override
  void initState() {
    super.initState();
    mapController = MapController(
      initPosition: GeoPoint(
        latitude: -10.1689,
        longitude: -48.3317,
      ),
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
            mapIsLoading: mapIsLoading(
              context,
              sizeWidth / 9,
              sizeHeight / 6,
            ),
            onMapIsReady: (mapEvent) {
              drawMap();
              limitAreaMap();
            },
            controller: mapController,
            osmOption: const OSMOption(
              zoomOption: ZoomOption(
                // Zoom para fixar no Tocantins
                initZoom: 6.48505,
                minZoomLevel: 6.48505,
                maxZoomLevel: 19,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget mapIsLoading(
    BuildContext context,
    double width,
    double height,
  ) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: CustomColors.green500,
        ),
      ),
    );
  }

  Future<void> drawMap() async {
    List mapList = [];
    List<dynamic> coordenandas;
    tocantinsMap = await jsonRead(
        pathFile: "lib/app/core/assets/json/map_of_tocantins.json");

    tocantinsMap.map(
      (key, value) {
        if (key.contains("features")) {
          mapList = value;
          if (mapList.isNotEmpty) {
            for (var mapCity in mapList) {
              coordenandas = mapCity['geometry']['coordinates'][0];
              print(coordenandas);
              coordenandas.forEach((element) {
                print(element);
              });
            }
          }
        }
        return MapEntry(key, value);
      },
    );
  }

  Future<void> limitAreaMap() async {
    await mapController.limitAreaMap(
      BoundingBox(
        east: -45.54,
        north: -4.91,
        south: -13.60,
        west: -50.98,
      ),
    );
  }
}
