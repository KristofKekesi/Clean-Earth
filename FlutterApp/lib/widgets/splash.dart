import 'package:cleanearth/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'localization.dart';
import 'map.dart';

// cooldown timeouts
int reportCooldown = 300; // sec 300
int pickupCooldown = 900; // sec 900

DateTime nextReport;
DateTime nextPickup;

// set Twitter login variables
bool isTwitterSignedIn = false;
String twitterId = "";
String twitterUsername = "";

Future<Widget> setup(context) async {
  // update values from local files
  final prefs = await SharedPreferences.getInstance();

  // check for next available interactions
  nextReport = DateTime.parse(prefs.getString("nextReport") ?? DateTime.now().toString());
  nextPickup =  DateTime.parse(prefs.getString("nextPickup") ?? DateTime.now().toString());

  // Twitter
  isTwitterSignedIn = prefs.getBool("isTwitterSignedIn") ?? isTwitterSignedIn;
  twitterId = prefs.getString("twitterId") ?? "";
  twitterUsername = prefs.getString("twitterUsername") ?? "";

  // safety measures
  if (twitterId == null ||
      twitterUsername == null ||
      twitterId == "" ||
      twitterUsername == "") {
    isTwitterSignedIn = false;
  }

  // initialize FireBase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // pickup map
  await updateMarkers();

  return Future.value(HomePage());
}

class CustomSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterFuture: setup(context),
      title: Text(
        AppLocalizations.of(context).translate("title"),
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      loadingText: Text(
        AppLocalizations.of(context).translate("connecting"),
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      imageBackground: AssetImage('lib/images/background.jpg'),
      image: Image(
        image: AssetImage('lib/images/logo.png'),
      ),
      photoSize: 50,
      loaderColor: Colors.white,
    );
  }

}