import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'splash.dart';
import 'about.dart';
import 'map.dart';

Future<void> firebasePushRepost(isAnonymous) async {

  final prefs = await SharedPreferences.getInstance();

  String twttr;
  if (isTwitterSignedIn) {
    twttr = twitterId;
  } else {
    twttr = null;
  }

  // read localRepostId
  int localRepostId = prefs.getInt("localRepostId") ?? 0;

  //push Repost data to Firebase
  FirebaseFirestore.instance.collection('repost').add(
    {
      "at": {
        "latitude": currentPosition.latitude,
        "longitude": currentPosition.longitude,
      },
      "date": Timestamp.fromDate(DateTime.now()),
      "isReposted": false,
      "isAnonymous": isAnonymous,
      "twttr": twttr,
      "localId": localRepostId + 1,
      "appVersion": appVersion,
    },
  );

  // write localRepostId
  prefs.setInt('localRepostId', localRepostId + 1);
}

Future<void> firebasePushPickup() async {

  final prefs = await SharedPreferences.getInstance();

  // read localPickupId
  int localPickupId = prefs.getInt("localPickupId") ?? 0;

  //push Pickup data to Firebase
  FirebaseFirestore.instance.collection('pickup').add(
    {
      "at": {
        "latitude": currentPosition.latitude,
        "longitude": currentPosition.longitude,
      },
      "date": Timestamp.fromDate(DateTime.now()),
      "localId": localPickupId + 1,
      "appVersion": appVersion,
    },
  );

  // add (pickup) marker changes
  markers.add(
    Marker(
      width: 10,
      height: 10,
      point: currentPosition,
      builder: (ctx) => Icon(
        Icons.circle,
        color: Colors.green,
        size: 15,
      ),
    ),
  );
  
  // write localPickupId
  prefs.setInt('localPickupId', localPickupId + 1);
}

Future<void> firebasePushReport() async {

  final prefs = await SharedPreferences.getInstance();

  // read localReportId
  int localReportId = prefs.getInt("localReportId") ?? 0;

  //push Report data to Firebase
  FirebaseFirestore.instance.collection('report').add(
    {
      "at": {
        "latitude": currentPosition.latitude,
        "longitude": currentPosition.longitude,
      },
      "date": Timestamp.fromDate(DateTime.now()),
      "localId": localReportId + 1,
      "appVersion": appVersion,
    },
  );

  // add (report) marker changes
  markers.add(
    Marker(
      width: 10,
      height: 10,
      point: currentPosition,
      builder: (ctx) => Icon(
        Icons.circle,
        color: Colors.red,
        size: 10,
      ),
    ),
  );

  // write localReportId
  prefs.setInt('localReportId', localReportId + 1);
}