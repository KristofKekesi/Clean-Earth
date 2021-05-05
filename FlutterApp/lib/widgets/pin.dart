import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                3 *
                .05,
            right: (MediaQuery.of(context).size.width +
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
            width: (MediaQuery.of(context).size.width +
                    MediaQuery.of(context).size.height) /
                3 *
                .15,
            decoration:
                BoxDecoration(color: Color.fromRGBO(0, 0, 0, .6)), // light
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
              child: GestureDetector(
                onTap: () {
                  print("pin");
                },
                child: Padding(
                  padding: EdgeInsets.all(
                    (MediaQuery.of(context).size.width +
                            MediaQuery.of(context).size.height) /
                        3 *
                        .035,
                  ),
                  child: Icon(
                    CupertinoIcons.map_pin,
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
          ),
        ),
      ),
    );
  }
}
