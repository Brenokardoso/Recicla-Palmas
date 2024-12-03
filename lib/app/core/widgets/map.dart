import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/json_read.dart';
import 'package:recicla_palmas/app/core/utils/routes.dart';
import 'package:recicla_palmas/app/core/widgets/custom_card_item.dart';

class OsmImplemetation extends StatefulWidget {
  const OsmImplemetation({
    this.widthScream,
    this.heightScream,
    super.key,
  });
  final double? heightScream;
  final double? widthScream;

  @override
  State<OsmImplemetation> createState() => _OSMState();
}

class _OSMState extends State<OsmImplemetation> {
  late final MapController mapController;
  Map<String, dynamic> tocantinsMap = {};
  Map<String, dynamic> ecoPoints = {};
  List<GeoPoint> geoPointList = [
    GeoPoint(
      latitude: -10.1800044,
      longitude: -48.3398663,
    ),
    GeoPoint(
      latitude: -10.199413,
      longitude: -48.3137959,
    ),
    GeoPoint(
      latitude: -10.2170479,
      longitude: -48.3347741,
    ),
    GeoPoint(
      latitude: -10.1826897,
      longitude: -48.3469972,
    ),
    GeoPoint(
      latitude: -10.2074703,
      longitude: -48.3469764,
    ),
    GeoPoint(
      latitude: -10.1947066,
      longitude: -48.3273138,
    ),
    GeoPoint(
      latitude: -10.2184872,
      longitude: -48.3402029,
    ),
    GeoPoint(
      latitude: -10.2461177,
      longitude: -48.345443,
    ),
    GeoPoint(
      latitude: -10.182342,
      longitude: -48.336706,
    ),
    GeoPoint(
      latitude: -10.1766799,
      longitude: -48.3470613,
    ),
    GeoPoint(
      latitude: -10.1823224,
      longitude: -48.3355458,
    ),
    GeoPoint(
      latitude: -10.1817440,
      longitude: -48.3166820,
    ),
  ];
  Map<String, dynamic> geoMap = {};
  List cardInformations = [];

  @override
  void initState() {
    super.initState();
    //mapController = MapController.withUserPosition(
    //   trackUserLocation: const UserTrackingOption(
    //     enableTracking: true, unFollowUser: false));
    mapController = MapController(
      initPosition: GeoPoint(
        latitude: -10.1689,
        longitude: -48.3317,
      ),
    );
    cathGeoPoitns();
    cathEcoPoints();
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
    String cardImage = "lib/app/core/assets/img/image_auth_backgorund.png";

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: widget.widthScream ?? sizeWidth * 0.8075,
                height: widget.heightScream ?? sizeHeight * 0.65,
                child: Stack(
                  children: [
                    OSMFlutter(
                      mapIsLoading: mapIsLoading(
                        context,
                        sizeWidth / 10,
                        sizeHeight / 7,
                      ),
                      onGeoPointClicked: (clickedGeoPoint) {
                        for (var item in geoPointList) {
                          if (item == clickedGeoPoint) {
                            null;
                          }
                        }
                      },
                      onMapIsReady: (mapEvent) async {
                        await limitAreaMap();
                        await drawnTocantinsMap();
                        await drawPointsIntheMap();
                        // await goTocurrentLocation();
                      },
                      controller: mapController,
                      osmOption: const OSMOption(
                        zoomOption: ZoomOption(
                          // Zoom para fixar no Tocantins
                          initZoom: 13.5,
                          minZoomLevel: 6.0,
                          maxZoomLevel: 19,
                        ),
                        showContributorBadgeForOSM: true,
                        showDefaultInfoWindow: true,
                        showZoomController: false,
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 40,
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: PointerInterceptor(
                          child: IconButton(
                            color: CustomColors.green500,
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color?>(
                                CustomColors.green500,
                              ),
                            ),
                            onPressed: () async {
                              GeoPoint myLocation =
                                  await mapController.myLocation();
                              await mapController.goToLocation(myLocation);
                              await mapController.changeLocation(myLocation);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.mapLocation,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  dynamic drawPointsIntheMap() async {
    // FAVOR,NÃO TROQUE ESSA BOSTA POR UM .MAP
    geoPointList.forEach(
      (geoPoint) async {
        await mapController.addMarker(
          geoPoint,
          markerIcon: MarkerIcon(
            icon: Icon(
              Icons.location_on,
              color: CustomColors.inputBorderEnableColor,
              size: 25,
            ),
          ),
        );
      },
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

  Future<void> drawnTocantinsMap() async {
    geoMap.forEach(
      (cityName, geoPoitsCity) async {
        await mapController.drawRoadManually(
          geoPoitsCity,
          customRoadOption,
        );
      },
    );
  }

  Future<void> goTocurrentLocation() async {
    GeoPoint myLocation = await mapController.myLocation();
    await mapController.goToLocation(myLocation);
    await mapController.zoomIn();
    await mapController.zoomIn();
  }

  RoadOption customRoadOption = const RoadOption(
    roadColor: Colors.blueGrey,
    roadWidth: 3,
    zoomInto: false,
  );

  Future<List<dynamic>> cathEcoPoints() async {
    ecoPoints = await jsonRead(
      pathFile: "lib/app/core/assets/json/pontos_de_coleta.json",
    );
    cardInformations = ecoPoints["pontos_de_coleta"];
    return cardInformations;
  }

  Future<void> cathGeoPoitns() async {
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
              String cityName = mapCity["properties"]["name"];
              coordenandas = mapCity['geometry']['coordinates'];
              List<GeoPoint> cityGeoPoints = [];
              geoMap.putIfAbsent(cityName, () => []);
              for (var majorCoords in coordenandas) {
                for (var minorCoords in majorCoords) {
                  GeoPoint myCoords = GeoPoint(
                    longitude: minorCoords[0],
                    latitude: minorCoords[1],
                  );
                  cityGeoPoints.add(myCoords);
                }
              }
              geoMap[cityName] = cityGeoPoints;
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
