import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:recicla_palmas/app/core/themes/custom_colors.dart';
import 'package:recicla_palmas/app/core/utils/json_read.dart';
import 'package:recicla_palmas/app/core/widgets/custom_card_item.dart';

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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: sizeWidth * 0.8,
                  height: sizeHeight * 0.65,
                  child: OSMFlutter(
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
                    },
                    controller: mapController,
                    osmOption: const OSMOption(
                      zoomOption: ZoomOption(
                        // Zoom para fixar no Tocantins
                        initZoom: 6.48505,
                        minZoomLevel: 6.48505,
                        maxZoomLevel: 19,
                      ),
                      showContributorBadgeForOSM: true,
                      showDefaultInfoWindow: true,
                      showZoomController: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Center(
              child: SizedBox(
                child: Text("Locais para o descarte de materais recicláveis:"),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: sizeWidth * 0.9,
              child: Wrap(
                runAlignment: WrapAlignment.start,
                alignment: sizeWidth < 650
                    ? WrapAlignment.center
                    : WrapAlignment.center,
                spacing: 30,
                runSpacing: 10,
                children: [
                  customCardItem(
                    pathImage: cardImage,
                    descricao:
                        "Ecoponto da ACNO 1 (103 Norte) - Anexo III da Corregedoria da Justiça",
                    descricaoDosMateriais: "Metal, papel, plástico",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto da Arse 34 (310 Sul) - IFTO",
                    descricaoDosMateriais: "Papel, plástico, metal, vidro",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao:
                        "Ecoponto da AASE 50 (502 Sul) - Defensoria Pública na Avenida Teotônio Segurado",
                    descricaoDosMateriais: "Metal, plástico, papel",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto da Arno 12 (105 Norte) Prédio Royal",
                    descricaoDosMateriais: "Plástico, metal, papel",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto na Praça da Arso 42 (405 Sul)",
                    descricaoDosMateriais: "Vidro, metal, papel, plástico",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto na Praça da Arse 21 (204 Sul)",
                    descricaoDosMateriais: "Papel, vidro, metal, plástico",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto da Arso 61 (603 Sul)",
                    descricaoDosMateriais: "Papel, metal, plástico",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto da Arso 102 (1005 Sul)",
                    descricaoDosMateriais: "Metal, plástico, papel",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto na Praça dos Girassóis (Terratins)",
                    descricaoDosMateriais: "Plástico, papel, metal, vidro",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao:
                        "Ecoponto da Arno 22 (205 Norte) Condomínio Privillege",
                    descricaoDosMateriais: "Papel, metal, plástico",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao:
                        "Ecoponto na Praça dos Girassóis (Tribunal de Justiça)",
                    descricaoDosMateriais: "Metal, vidro, plástico, papel",
                  ),
                  customCardItem(
                    pathImage: cardImage,
                    descricao: "Ecoponto na Praça da Arne 13 (108 Norte)",
                    descricaoDosMateriais: "Papel, plástico, metal, vidro",
                  ),
                ],
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
