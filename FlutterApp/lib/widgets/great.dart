import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class GreatJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
        initialChildSize: .525,
        maxChildSize: .525,
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
            child: Container(
              color: Colors.white,
              child: ListView(
                controller: scrollController,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .525,
                    child: Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * .05,
                    ),
                    child:
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                left:
                                    MediaQuery.of(context).size.height * .0175,
                              ),
                              child: Text(
                                AppLocalizations.of(context).translate("greatjob"),
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
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      AutoSizeText(
                                        AppLocalizations.of(context).translate("greatjobdisclaimer"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff53786F),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                .025,
                                          ),
                                          child: Image(
                                            image: AssetImage(
                                                "lib/illustration/good.png"),
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
                  ),),
                ],
              ),
            ),
          );
        });
  }
}
