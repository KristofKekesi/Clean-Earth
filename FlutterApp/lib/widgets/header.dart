import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanearth/widgets/localization.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ClipRect(child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: (MediaQuery.of(context)
                .size
                .height +
                MediaQuery.of(context)
                    .size
                    .width) /
                2 *
                .02,
            sigmaY: (MediaQuery.of(context)
                .size
                .height +
                MediaQuery.of(context)
                    .size
                    .width) /
                2 *
                .02),
        child: SafeArea(child: Container(
          child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * .1,
            right: MediaQuery.of(context).size.width * .25,
            top: MediaQuery.of(context).size.height * .02,
            bottom: MediaQuery.of(context).size.height * .02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(AppLocalizations.of(context).translate("title"), textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff333333), // light
                  //color: Colors.white, // dark
                  fontSize: MediaQuery.of(context).size.width * .08,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      ),
      ),
    ),
    );
  }
}