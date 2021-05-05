import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanearth/widgets/anonymous.dart';
import 'package:cleanearth/widgets/firebasePush.dart';
import 'package:cleanearth/widgets/great.dart';
import 'package:cleanearth/widgets/loginReminder.dart';
import 'package:cleanearth/widgets/signInTwitter.dart';
import 'package:cleanearth/widgets/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization.dart';

AutoSizeGroup loginButtonTextSize = AutoSizeGroup();
AutoSizeGroup loggedinButtonTextSize = AutoSizeGroup();

class Login extends StatelessWidget {
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
                                AppLocalizations.of(context).translate("login"),
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
                                          .translate("logindisclaimer"),
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
                                              .015),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate("logindisclaimertwo"),
                                        style: TextStyle(
                                          color: Color(0xff53786F),
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .025,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top:
                            //       MediaQuery.of(context).size.height * .01),
                            //   child: GestureDetector(
                            //     child: Tooltip(
                            //       message: AppLocalizations.of(context)
                            //           .translate("tooltipSigninwithgoogle"),
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //             color: Color(0xffF2F2F2),
                            //             borderRadius: BorderRadius.circular(
                            //                 (MediaQuery.of(context)
                            //                     .size
                            //                     .height +
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .width) /
                            //                     2 *
                            //                     .025)),
                            //         width: (MediaQuery.of(context).size.height +
                            //             MediaQuery.of(context).size.width) /
                            //             2 *
                            //             .86,
                            //         child: Padding(
                            //           padding: EdgeInsets.only(
                            //             top:
                            //             MediaQuery.of(context).size.height *
                            //                 .0175,
                            //             bottom:
                            //             MediaQuery.of(context).size.height *
                            //                 .0175,
                            //           ),
                            //           child: Row(
                            //             children: [
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width -
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .1) *
                            //                     .083,
                            //               ),
                            //               Image(
                            //                 image: AssetImage(
                            //                     "lib/images/google.png"),
                            //                 width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width -
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .1) *
                            //                     .084,
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width -
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .1) *
                            //                     .0415,
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width -
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .1) *
                            //                     .7085,
                            //                 child: AutoSizeText(
                            //                   AppLocalizations.of(context)
                            //                       .translate(
                            //                       "signinwithgoogle"),
                            //                   style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.black,
                            //                     fontSize: MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .03,
                            //                   ),
                            //                   maxLines: 1,
                            //                   group: loginButtonTextSize,
                            //                 ),
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                     .size
                            //                     .width -
                            //                     MediaQuery.of(context)
                            //                         .size
                            //                         .height *
                            //                         .1) *
                            //                     .083,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top:
                                  MediaQuery.of(context).size.height * .01),
                              child: GestureDetector(
                                child: TwitterSignInButton(),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(
                            //       top:
                            //           MediaQuery.of(context).size.height * .01),
                            //   child: GestureDetector(
                            //     child: Tooltip(
                            //       message: AppLocalizations.of(context)
                            //           .translate("tooltipSigninwithfacebook"),
                            //       child: Container(
                            //         decoration: BoxDecoration(
                            //             color: Color(0xff1877F2),
                            //             borderRadius: BorderRadius.circular(
                            //                 (MediaQuery.of(context)
                            //                             .size
                            //                             .height +
                            //                         MediaQuery.of(context)
                            //                             .size
                            //                             .width) /
                            //                     2 *
                            //                     .025)),
                            //         width: (MediaQuery.of(context).size.height +
                            //                 MediaQuery.of(context).size.width) /
                            //             2 *
                            //             .86,
                            //         child: Padding(
                            //           padding: EdgeInsets.only(
                            //             top:
                            //                 MediaQuery.of(context).size.height *
                            //                     .0175,
                            //             bottom:
                            //                 MediaQuery.of(context).size.height *
                            //                     .0175,
                            //           ),
                            //           child: Row(
                            //             children: [
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                             .size
                            //                             .width -
                            //                         MediaQuery.of(context)
                            //                                 .size
                            //                                 .height *
                            //                             .1) *
                            //                     .083,
                            //               ),
                            //               Image(
                            //                 image: AssetImage(
                            //                     "lib/images/facebook.png"),
                            //                 width: (MediaQuery.of(context)
                            //                             .size
                            //                             .width -
                            //                         MediaQuery.of(context)
                            //                                 .size
                            //                                 .height *
                            //                             .1) *
                            //                     .084,
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                             .size
                            //                             .width -
                            //                         MediaQuery.of(context)
                            //                                 .size
                            //                                 .height *
                            //                             .1) *
                            //                     .0415,
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                             .size
                            //                             .width -
                            //                         MediaQuery.of(context)
                            //                                 .size
                            //                                 .height *
                            //                             .1) *
                            //                     .7085,
                            //                 child: AutoSizeText(
                            //                   AppLocalizations.of(context)
                            //                       .translate(
                            //                           "signinwithfacebook"),
                            //                   style: TextStyle(
                            //                     fontWeight: FontWeight.bold,
                            //                     color: Colors.white,
                            //                     fontSize: MediaQuery.of(context)
                            //                             .size
                            //                             .height *
                            //                         .03,
                            //                   ),
                            //                   maxLines: 1,
                            //                   group: loginButtonTextSize,
                            //                 ),
                            //               ),
                            //               Container(
                            //                 width: (MediaQuery.of(context)
                            //                             .size
                            //                             .width -
                            //                         MediaQuery.of(context)
                            //                                 .size
                            //                                 .height *
                            //                             .1) *
                            //                     .083,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                if (isTwitterSignedIn) {
                                  nextPickup = DateTime.now().add(Duration(seconds: pickupCooldown));

                                  final prefs = await SharedPreferences.getInstance();
                                  prefs.setString('nextPickup', nextPickup.toString());

                                  Navigator.pop(context);
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        firebasePushRepost(false);
                                        firebasePushPickup();
                                        return GreatJob();
                                      });
                                } else {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return LoginReminder();
                                      });
                                }
                              },
                              child: Tooltip(
                                message: AppLocalizations.of(context)
                                    .translate("tooltipPickupLoginFinish"),
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
                                      MediaQuery.of(context).size.height *
                                          .0175,
                                    ),
                                    child: Center(
                                      child: AutoSizeText(
                                        AppLocalizations.of(context)
                                            .translate("finish"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .03,
                                        ),
                                        maxLines: 1,
                                        group: loginButtonTextSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                nextPickup = DateTime.now().add(Duration(seconds: pickupCooldown));

                                final prefs = await SharedPreferences.getInstance();
                                prefs.setString('nextPickup', nextPickup.toString());

                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Anonymous();
                                    });
                              },
                              child: Tooltip(
                                message: AppLocalizations.of(context).translate(
                                    "tooltipContinuePickupAnonymously"),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.height *
                                          .01),
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .translate("continueanonymously"),
                                    style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              .0225,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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
