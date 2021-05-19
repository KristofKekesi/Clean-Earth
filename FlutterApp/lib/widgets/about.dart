import 'dart:ui';

import 'package:cleanearth/widgets/promo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization.dart';

String appVersion = "1.0";

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .85,
        maxChildSize: .85,
        builder: (BuildContext context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                (MediaQuery.of(context).size.height +
                        MediaQuery.of(context).size.width) /
                    2 *
                    .1,
              ),
              topRight: Radius.circular((MediaQuery.of(context).size.height +
                      MediaQuery.of(context).size.width) /
                  2 *
                  .1),
            ),
            child: ListView(
              controller: scrollController,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .85,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05,
                      bottom: MediaQuery.of(context).size.height * .05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * .05,
                            right: MediaQuery.of(context).size.height * .05,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.height *
                                      .0175,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)
                                      .translate("about"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .04,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  autoAboutDialog(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xffF2F2F2),
                                      borderRadius: BorderRadius.circular(
                                          (MediaQuery.of(context).size.height +
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width) /
                                              2 *
                                              .025)),
                                  width: (MediaQuery.of(context).size.height +
                                          MediaQuery.of(context).size.width) /
                                      2 *
                                      .86,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          .0175,
                                    ),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              AppLocalizations.of(context)
                                                  .translate("title"),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff53786F),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .03,
                                              ),
                                            ),
                                            Text(
                                              appVersion,
                                              style: TextStyle(
                                                color: Color(0xff53786F),
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .025,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .025,
                                                ),
                                                child: Image(
                                                  image: AssetImage(
                                                      "lib/illustration/phone.png"),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .22,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Tooltip(
                                            message: AppLocalizations.of(
                                                    context)
                                                .translate("tooltipAboutMore"),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .015,
                                              ),
                                              child: Icon(
                                                CupertinoIcons.chevron_right,
                                                size: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    .05,
                                                color: Color(0xff53786F),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .01),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate("creator"),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .0225,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        PromoWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

void autoAboutDialog(context) async {
  final prefs = await SharedPreferences.getInstance();

  showAboutDialog(
    context: context,
    applicationVersion: appVersion,
    applicationName: AppLocalizations.of(context).translate("title"),
    applicationLegalese: 'Kristóf Kékesi',
    children: [
      Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.width * .07,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(AppLocalizations.of(context).translate("totalPickup")),
                  Text(AppLocalizations.of(context).translate("totalReport")),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text((prefs.getInt("localPickupId") ?? 0).toString()),
                  Text((prefs.getInt("localReportId") ?? 0).toString()),
                ],
              ),
            ],
          )
        ],
      ),
    ],
  );
}
