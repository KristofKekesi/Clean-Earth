import 'dart:ui';

import 'package:cleanearth/widgets/localization.dart';
import 'package:cleanearth/widgets/login.dart';
import 'package:cleanearth/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'anonymous.dart';
import 'countdown.dart';

class ActivePickupTrash extends StatelessWidget {
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
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * .05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * .0175,
                              ),
                              child: Text(
                                AppLocalizations.of(context).translate("pickuppagetitle"),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height * .04,
                                ),
                              ),
                            ),
                            Container(
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
                                  MediaQuery.of(context).size.height * .0175,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context).translate("pickupdisclaimertwo"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff53786F),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .01),
                                      child: Text(
                                        AppLocalizations.of(context).translate("pickupdisclaimer"),
                                        style: TextStyle(
                                          color: Color(0xff53786F),
                                          fontSize: MediaQuery.of(context)
                                              .size
                                              .height *
                                              .025,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              .025,
                                        ),
                                        child: Image(
                                          image: AssetImage(
                                              "lib/illustration/pickup.png"),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Login();
                                    });
                              },
                              child:  Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("tooltipContinuePickup"),
                                child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xff53786F),
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
                                    MediaQuery.of(context).size.height * .0175,
                                  ),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context).translate("continue"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .03,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Anonymous();
                                    });
                              },
                              child:  Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("tooltipContinuePickupAnonymously"),
                                child: Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(context).size.height *
                                        .01),
                                child: Text(
                                  AppLocalizations.of(context).translate("continueanonymously"),
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            .0225,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),),
                          ],
                        ),
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

class InactivePickupTrash extends StatefulWidget {
  @override
  _InactivePickupTrashState createState() => _InactivePickupTrashState();
}

class _InactivePickupTrashState extends State<InactivePickupTrash> {
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
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * .05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left:
                                MediaQuery.of(context).size.height * .0175,
                              ),
                              child: Text(
                                AppLocalizations.of(context).translate("pickuppagetitle"),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                  MediaQuery.of(context).size.height * .04,
                                ),
                              ),
                            ),
                            Container(
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
                                  MediaQuery.of(context).size.height * .0175,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      AppLocalizations.of(context).translate("countdowndisclaimer"),
                                      style: TextStyle(
                                        color: Color(0xff53786F),
                                        fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(MediaQuery.of(context).size.height * .0175),
                                      child:Align(
                                        alignment: Alignment.center,
                                        child: Countdown(countdownName: "pickup", popupContext: context,),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:  Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("back"),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xff53786F),
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
                                      MediaQuery.of(context).size.height * .0175,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalizations.of(context).translate("back"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize:
                                          MediaQuery.of(context).size.height *
                                              .03,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),),
                          ],
                        ),
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

class PickupTrash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (DateTime.now().isAfter(nextPickup) ||
        DateTime.now().isAtSameMomentAs(nextPickup)) {
      return ActivePickupTrash();
    } else {
      return InactivePickupTrash();
    }
  }
}