import 'dart:async';

import 'package:cleanearth/shared.dart';
import 'package:cleanearth/widgets/localization.dart';
import 'package:cleanearth/widgets/zoom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

MapController mapController = MapController();

LatLng mapCenter;


// markers except you are here
List<Marker> markers = [];

bool isReportUpdated = false;
bool isPickupUpdated = false;
Future<void> updateMarkers() async {
  if (!isPickupUpdated) {
    // update pickup
    final pickupMapData = await FirebaseFirestore.instance.collection("pickup").get();
    for (int index = 0; index < pickupMapData.docs.length; index++) {
      print("(pickup)marker found at" + pickupMapData.docs[index]["at"]["latitude"].toString() + ";" + pickupMapData.docs[index]["at"]["longitude"].toString());
      markers.add(
          Marker(
            width: 10,
            height: 10,
            point: LatLng(double.parse(pickupMapData.docs[index]["at"]["latitude"].toString()), double.parse(pickupMapData.docs[index]["at"]["longitude"].toString())),
            builder: (ctx) => Icon(
              Icons.circle,
              color: Colors.green,
              size: 15,
            ),
          )
      );
    }

    isPickupUpdated = true;
  }

  if (!isReportUpdated) {
    // update report
    final pickupMapData = await FirebaseFirestore.instance.collection("report").get();
    for (int index = 0; index < pickupMapData.docs.length; index++) {
      print("(report)marker found at" + pickupMapData.docs[index]["at"]["latitude"].toString() + ";" + pickupMapData.docs[index]["at"]["longitude"].toString());
      markers.add(
          Marker(
            width: 10,
            height: 10,
            point: LatLng(double.parse(pickupMapData.docs[index]["at"]["latitude"].toString()), double.parse(pickupMapData.docs[index]["at"]["longitude"].toString())),
            builder: (ctx) => Icon(
              Icons.circle,
              color: Colors.red,
              size: 10,
            ),
          )
      );
    }

    isReportUpdated = true;
  }
}

double currentZoom = 17.0;
void zoomPlus() {
  currentZoom = mapController.zoom + .8;
  mapController.move(mapController.center, currentZoom);
}

void zoomMinus() {
  currentZoom = mapController.zoom - .8;
  mapController.move(mapController.center, currentZoom);
}

LatLng currentPosition;
// TODO function for pin location

class CustomMap extends StatefulWidget {
  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  Future<Position> _currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('gps-disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error("perma");
      }

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error("gps-disabled");
      }
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<void> initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // internet connection
    return FutureBuilder<bool>(
      future: connectionStatus(),
      // a previously-obtained Future<String> or null
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            // gps
            return FutureBuilder<Position>(
              future:
              _currentPosition(), // a previously-obtained Future<String> or null
              builder:
              // ignore: missing_return
                  (BuildContext context, AsyncSnapshot<Position> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.hasError) {
                    if (snapshot.error == "gps-disabled") {
                      return Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * .05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate("error"),
                              style: TextStyle(
                                color: Color(0xff53786F),
                                fontSize:
                                MediaQuery.of(context).size.width * .06,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate("gpsdisabled"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff53786F),
                                fontSize:
                                MediaQuery.of(context).size.width * .08,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                  MediaQuery.of(context).size.height * .025,
                                ),
                                child: Image(
                                  image:
                                  AssetImage("lib/illustration/phone.png"),
                                  height:
                                  MediaQuery.of(context).size.height * .22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else if (snapshot.error == "perma") {
                      Padding(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * .05,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context).translate("error"),
                              style: TextStyle(
                                color: Color(0xff53786F),
                                fontSize:
                                MediaQuery.of(context).size.width * .06,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .translate("gpsnotavailable"),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff53786F),
                                fontSize:
                                MediaQuery.of(context).size.width * .08,
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top:
                                  MediaQuery.of(context).size.height * .025,
                                ),
                                child: Image(
                                  image:
                                  AssetImage("lib/illustration/phone.png"),
                                  height:
                                  MediaQuery.of(context).size.height * .22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    Position position = snapshot.data;
                    currentPosition =
                        LatLng(position.latitude, position.longitude);
                    mapCenter = currentPosition;

                    //add you are here marker
                    List<Marker> markersWithYouAreHere = markers.toList();
                    markersWithYouAreHere.add(
                      Marker(
                        width: 35,
                        height: 35,
                        point: currentPosition,
                        builder: (ctx) => Tooltip(
                          message: AppLocalizations.of(context)
                              .translate(
                              "tooltipIndicatorCurrent"),
                          child: Icon(
                            Icons.accessibility_new_rounded,
                            color: Color(0xff333333),
                            size: 35,
                          ),
                        ),
                      ),
                    );

                    return Stack(
                      children: <Widget>[
                        FlutterMap(
                          mapController: mapController,
                          options: MapOptions(
                            onPositionChanged: (mapPos, boolVal) {},
                            center: mapCenter,
                            zoom: currentZoom,
                            minZoom: 1,
                            maxZoom: 18.49,
                          ),
                          layers: [
                            TileLayerOptions(
                                backgroundColor: Color(0xffD4DADC),
                                //urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                urlTemplate:
                                "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c']),
                            MarkerLayerOptions(
                              markers: markersWithYouAreHere,
                            ),
                          ],
                        ),
                        ZoomControls(),
                      ],
                    );
                  }
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * .05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate("error"),
                    style: TextStyle(
                      color: Color(0xff53786F),
                      fontSize: MediaQuery.of(context).size.width * .06,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context).translate("noconnection"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff53786F),
                      fontSize: MediaQuery.of(context).size.width * .08,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .025,
                      ),
                      child: Image(
                        image: AssetImage("lib/illustration/phone.png"),
                        height: MediaQuery.of(context).size.height * .22,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
