import 'dart:ui';
import 'package:cleanearth/shared.dart';
import 'package:cleanearth/widgets/about.dart';
import 'package:cleanearth/widgets/adddisabled.dart';
import 'package:cleanearth/widgets/articles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'add.dart';
import 'localization.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: (MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) /
              3 *
              .05),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(500)),
        child: Container(
          height: (MediaQuery.of(context).size.width +
                  MediaQuery.of(context).size.height) /
              3 *
              .15,
          decoration:
              BoxDecoration(color: Color.fromRGBO(0, 0, 0, .4)), // light
          //decoration: BoxDecoration(color: Color.fromRGBO(200, 200, 200, .3)), //dark
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                    2 *
                    .05,
                sigmaY: (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                    2 *
                    .05),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                    width: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        3 *
                        .035),
                // GestureDetector(
                //   onTap: () {
                //     showModalBottomSheet(
                //         isScrollControlled: true,
                //         context: context,
                //         builder: (context) {
                //           return Articles();
                //         });
                //   },
                //   child: Tooltip(
                //     message: AppLocalizations.of(context)
                //         .translate("tooltipArticles"),
                //     child: Padding(
                //     padding: EdgeInsets.all(
                //       (MediaQuery.of(context).size.width +
                //               MediaQuery.of(context).size.height) /
                //           3 *
                //           .035,
                //     ),
                //     child: Icon(
                //       Icons.insert_drive_file_outlined,
                //       color: Colors.white,
                //       //color: Color(0xff333333),
                //       size: (MediaQuery.of(context).size.width +
                //               MediaQuery.of(context).size.height) /
                //           3 *
                //           .07,
                //     ),
                //   ),),
                // ),
                GestureDetector(
                  onTap: () async {
                    bool isGPSEnabled =
                        await Geolocator.isLocationServiceEnabled();
                    LocationPermission isGPSPermission = await Geolocator.checkPermission();
                    bool networkStatus = await connectionStatus();

                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          if (isGPSEnabled == false || isGPSPermission == LocationPermission.deniedForever || isGPSPermission == LocationPermission.denied || networkStatus == false) {
                            return AddDisabled();
                          } else {
                            return Add();
                          }
                        });
                  },
                  child: Tooltip(
                    message:
                        AppLocalizations.of(context).translate("tooltipAdd"),
                    child: Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            3 *
                            .035,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        //color: Color(0xff333333),
                        size: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            3 *
                            .08,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return About();
                        });
                  },
                  child: Tooltip(
                    message:
                        AppLocalizations.of(context).translate("tooltipAbout"),
                    child: Padding(
                      padding: EdgeInsets.all(
                        (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            3 *
                            .035,
                      ),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        //color: Color(0xff333333),
                        size: (MediaQuery.of(context).size.width +
                                MediaQuery.of(context).size.height) /
                            3 *
                            .07,
                      ),
                    ),
                  ),
                ),
                Container(
                    width: (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        3 *
                        .035),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
