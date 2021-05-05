import 'dart:ui';

import 'package:cleanearth/widgets/localization.dart';
import 'package:cleanearth/widgets/map.dart';
import 'package:flutter/material.dart';

class ZoomControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                3 *
                .05,
            left: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                3 *
                .05),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(500)),
          child: Container(
            width: (MediaQuery.of(context).size.width +
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      width: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          3 *
                          .035,
                      height: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          5 *
                          .035),
                  GestureDetector(
                    onTap: () {
                      zoomPlus();
                    },
                    child: Tooltip(
                      message: AppLocalizations.of(context)
                          .translate("tooltipZoomin"),
                      child: Padding(
                        padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              3 *
                              .035,
                        ),
                        child: Icon(
                          Icons.zoom_in_outlined,
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
                  GestureDetector(
                    onTap: () {
                      zoomMinus();
                    },
                    child: Tooltip(
                      message: AppLocalizations.of(context)
                          .translate("tooltipZoomout"),
                      child: Padding(
                        padding: EdgeInsets.all(
                          (MediaQuery.of(context).size.width +
                                  MediaQuery.of(context).size.height) /
                              5 *
                              .035,
                        ),
                        child: Icon(
                          Icons.zoom_out_outlined,
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
                          .035,
                      height: (MediaQuery.of(context).size.width +
                              MediaQuery.of(context).size.height) /
                          4 *
                          .035),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
