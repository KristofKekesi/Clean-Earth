import 'dart:ui';

import 'package:cleanearth/widgets/countdown.dart';
import 'package:cleanearth/widgets/firebasePush.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'great.dart';
import 'splash.dart';
import 'localization.dart';

class ActiveReportTrash extends StatelessWidget {
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
                                AppLocalizations.of(context)
                                    .translate("reportpagetitle"),
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
                                      AppLocalizations.of(context)
                                          .translate("reportdisclaimer"),
                                      style: TextStyle(
                                        color: Color(0xff53786F),
                                        fontSize:
                                        MediaQuery.of(context).size.height *
                                            .03,
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
                                              "lib/illustration/report.png"),
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
                        GestureDetector(
                          onTap: () async {
                            nextReport = DateTime.now().add(Duration(seconds: reportCooldown));

                            final prefs = await SharedPreferences.getInstance();
                            prefs.setString('nextReport', nextReport.toString());

                            Navigator.pop(context);
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  firebasePushReport();
                                  return GreatJob();
                                });
                          },
                          child: Tooltip(
                            message: AppLocalizations.of(context)
                                .translate("tooltipFinishReportTrashButton"),
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
                                    AppLocalizations.of(context)
                                        .translate("reportbutton"),
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
                          ),
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

class InactiveReportTrash extends StatefulWidget {
  @override
  _InactiveReportTrashState createState() => _InactiveReportTrashState();
}

class _InactiveReportTrashState extends State<InactiveReportTrash> {
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
                                AppLocalizations.of(context)
                                    .translate("reportpagetitle"),
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
                                      child: Countdown(countdownName: "report", popupContext: context,),
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Tooltip(
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
                                    AppLocalizations.of(context)
                                        .translate("back"),
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
                          ),
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

class ReportTrash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (DateTime.now().isAfter(nextReport) ||
        DateTime.now().isAtSameMomentAs(nextReport)) {
      return ActiveReportTrash();
    } else {
      return InactiveReportTrash();
    }
  }
}