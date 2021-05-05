import 'dart:ui';

import 'package:cleanearth/widgets/pickup.dart';
import 'package:cleanearth/widgets/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class Add extends StatelessWidget {
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
                                AppLocalizations.of(context).translate("add"),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize:
                                      MediaQuery.of(context).size.height * .04,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return ReportTrash();
                                    });
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
                                    MediaQuery.of(context).size.height * .0175,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            AppLocalizations.of(context).translate("report"),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff53786F),
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .03,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                              MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .025,
                                            ),
                                            child: Image(
                                              image: AssetImage(
                                                  "lib/illustration/report.png"),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .22,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child:  Tooltip(
                                          message: AppLocalizations.of(context)
                                              .translate("tooltipReportTrashButton"),
                                          child: Padding(
                                          padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                .015,
                                          ),
                                          child: Icon(
                                            CupertinoIcons.right_chevron,
                                            color: Color(0xff53786F),
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .05,
                                          ),
                                        ),
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return PickupTrash();
                                });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(
                                    (MediaQuery.of(context).size.height +
                                            MediaQuery.of(context).size.width) /
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
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        AppLocalizations.of(context).translate("pickup"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff53786F),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                        ),
                                      ),
                                      Padding(
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
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child:  Tooltip(
                                      message: AppLocalizations.of(context)
                                          .translate("tooltipPickupButton"),
                                      child: Padding(
                                      padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height *
                                            .015,
                                      ),
                                      child: Icon(
                                        CupertinoIcons.right_chevron,
                                        color: Color(0xff53786F),
                                        size:
                                            MediaQuery.of(context).size.height *
                                                .05,
                                      ),
                                    ),
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },);
  }
}