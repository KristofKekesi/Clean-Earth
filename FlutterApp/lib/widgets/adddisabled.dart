import 'package:flutter/material.dart';

import 'localization.dart';

class AddDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .75,
        maxChildSize: .75,
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
                  Padding(
                    padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * .05,
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .65,
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
                                  AppLocalizations.of(context).translate("addNotAvailableTitle"),
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
                                        AppLocalizations.of(context).translate("addNotAvailableDisclaimer"),
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
                                ),
                              ),
                            ],
                          ),
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
              ],),
            ),
          ),],)),);
        });
  }
}
