import 'package:cleanearth/widgets/header.dart';
import 'package:cleanearth/widgets/localization.dart';
import 'package:cleanearth/widgets/map.dart';
import 'package:cleanearth/widgets/navbar.dart';
import 'package:cleanearth/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// https://blog.usejournal.com/creating-a-custom-color-swatch-in-flutter-554bcdcb27f3 (2021/04/11)
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void main() {
  return runApp(CleanEarthMain());
}

class CleanEarthMain extends StatefulWidget {
  @override
  _CleanEarthMainState createState() => _CleanEarthMainState();
}

class _CleanEarthMainState extends State<CleanEarthMain> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    builder: (context, child) {
      return ScrollConfiguration(
        behavior: NoScrollGlow(),
        child: child,);
    },

      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('hu', ''),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale.languageCode == supportedLocale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },

      debugShowCheckedModeBanner: false,
      title: "Clean Earth",
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xff53786F)),
        bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
      ),
      home: CustomSplash(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[CustomMap(), Header(), NavBar(),],
        ),
      ),
    );
  }
}