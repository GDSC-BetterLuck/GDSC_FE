// import 'dart:js';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jamera/pages/FlutterMap/api.dart';
import 'package:jamera/pages/Home/search_modal_result.dart';
// import 'package:jamera/pages/Home/search_page.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  bool findRoute = false;
  bool showDetails = false;

  final mapController = MapController();
  // static const _london = LatLng(9.536118, 49.162240);
  static const Map<String, String> latLngList = {
    'home': '6.125231015668568,1.216011652340683',
    'work': '6.145332, 1.243344'
  };
  static const _paris = LatLng(20.98996487480751, 105.94387681962446);
  static const _dublin = LatLng(21.01539401156824, 105.9422768653753);
  static const _center = LatLng(21.00635409146982, 105.93146626670605);

  var zoomMap = 13;
  void zoomIn() {
    setState(() {
      zoomMap += 1;
      mapController.move(mapController.camera.center, zoomMap.toDouble());
    });
  }

  void zoomOut() {
    setState(() {
      zoomMap -= 1;
      mapController.move(mapController.camera.center, zoomMap.toDouble());
    });
  }

  var _markers = [
    const Marker(
      width: 80,
      height: 80,
      point: _center,
      child: Icon(
        Icons.location_on,
        size: 40,
        color: Colors.blue,
      ),
    ),
  ];
  List listPoints = [];
  List<LatLng> points = [];
  getCoordinates() async {
    // Requesting for openrouteservice api
    // var response = await http.get(getRouteUrl(
    //     "1.2160116523406839,6.125231015668568", '1.243344,6.145332'));
    var response = await http.get(getRouteUrl(
        "105.94387681962446,20.98996487480751", "105.9422768653753,21.01539401156824"));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listPoints = data['features'][0]['geometry']['coordinates'];
        points = listPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
        _markers = const [
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
      }
      mapController.move(mapController.camera.center, 14);
    });
  }

  void toggleFindRoute(bool value) {
    setState(() {
      findRoute = value;
    });
  }
  void showDetailsModal(bool value){
    setState(() {
      showDetails = value;
    });
  }

  Future _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const SearchPageResult());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("phong"),
        //   actions: [
        //     IconButton(onPressed: () => _showModalBottomSheet(context), icon:const Icon(Icons.abc))
        //   ],
        // ),
        body: Stack(
      children: <Widget>[
        FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: _center,
            initialZoom: zoomMap.toDouble(),
            maxZoom: 100,
            minZoom: 3,
            keepAlive: true,
            interactionOptions: const InteractionOptions(),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              tileProvider: null,
            ),
            PolylineLayer(
              polylineCulling: false,
              polylines: [
                Polyline(
                  points: points,
                  color: Colors.blue,
                  strokeWidth: 10.0,
                )
              ],
            ),
            MarkerLayer(markers: _markers),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 80, 10, 10),
          child: Column(
            children: [
              TextField(
                  controller: controller,
                  onTap: (){toggleFindRoute(true);},
                  onTapOutside: (event) => {
                        toggleFindRoute(false),
                        FocusScope.of(context).unfocus()
                      },
                  decoration: InputDecoration(
                    prefixIcon: !findRoute
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 10,
                              height: 0,
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/logo/small_logo_resize.png"))),
                            ),
                          )
                        : const Icon(Icons.gps_not_fixed_outlined),
                    labelText: 'Enter your start point',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.0)),
                    suffixIcon: IconButton(
                        onPressed: () {
                          // _showModalBottomSheet(context);
                          showDetailsModal(true);
                          getCoordinates();
                        },
                        splashColor: Colors.blue,
                        tooltip: 'Find road',
                        icon: const Icon(Icons.search)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 248, 248),
                  )),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: findRoute,
                child: TextField(
                    decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  labelText: 'Enter your end point',
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 1, color: Color.fromARGB(255, 219, 210, 210)),
                      borderRadius: BorderRadius.circular(10.0)),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 253, 248, 248),
                )),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  // width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan.shade400,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10))),
                        child: IconButton(
                          icon: const Icon(
                            Icons.zoom_in_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            zoomIn();
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan.shade400,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10))),
                        child: IconButton(
                          icon: const Icon(
                            Icons.zoom_out_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            zoomOut();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showDetails,
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                alignment: AlignmentDirectional.bottomCenter,
                // width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0))),
                        child: MaterialButton(
                          onPressed: () {
                            _showModalBottomSheet(context);
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_upward_sharp),
                              SizedBox(
                                width: 5,
                              ),
                              Text("See details"),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
