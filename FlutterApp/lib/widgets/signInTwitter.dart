import 'package:auto_size_text/auto_size_text.dart';
import 'package:cleanearth/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization.dart';
import 'login.dart';

Future<void> storeTwitterLoginVariables() async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setBool("isTwitterSignedIn", isTwitterSignedIn);
  prefs.setString("twitterId", twitterId ?? "");
  prefs.setString("twitterUsername", twitterUsername ?? "");
}

ValueNotifier<String> _twitterLoginListener = ValueNotifier("");

Future<TwitterSession> twitterSignIn() async {
  var twitterLogin = new TwitterLogin(
    consumerKey: 'visswsVSBEAoBLoRAf1kjPJKm',
    consumerSecret: 'c9bOI8STeB8ADkk3Josj3NM8R0kZOE16vxAY3jGrMKjVFFDBFC',
  );

  final TwitterLoginResult result = await twitterLogin.authorize();

  switch (result.status) {
    case TwitterLoginStatus.loggedIn:
      print('Logged in! username: ${result.session.username}');
      return result.session;
    case TwitterLoginStatus.cancelledByUser:
      print('Login cancelled by user.');
      return Future.error("cancelled");
    case TwitterLoginStatus.error:
      print('Login error: ${result.errorMessage}');
      return Future.error("error");
    default:
      return Future.error("unknown error");
  }
}

class TwitterSignInButtonFace extends StatefulWidget {
  @override
  _TwitterSignInButtonFaceState createState() =>
      _TwitterSignInButtonFaceState();
}

class _TwitterSignInButtonFaceState extends State<TwitterSignInButtonFace> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        TwitterSession result = await twitterSignIn();
        print(result.userId);
        setState(() {
          isTwitterSignedIn = true;
          twitterId = result.userId;
          twitterUsername = result.username;

          _twitterLoginListener.value = result.username;

          storeTwitterLoginVariables();
        });
      },
      child: Tooltip(
        message:
            AppLocalizations.of(context).translate("tooltipSigninwithtwitter"),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xff1DA1F2),
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
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .0175,
              bottom: MediaQuery.of(context).size.height * .0175,
            ),
            child: Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.height * .1) *
                      .083,
                ),
                Image(
                  image: AssetImage("lib/images/twitter.png"),
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.height * .1) *
                      .084,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.height * .1) *
                      .0415,
                ),
                Container(
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.height * .1) *
                      .583,
                  child: AutoSizeText(
                    AppLocalizations.of(context).translate("signinwithtwitter"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height * .03,
                    ),
                    maxLines: 1,
                    minFontSize: 1,
                    group: loginButtonTextSize,
                  ),
                ),
                Opacity(
                  opacity: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .0415,
                      right: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .083,
                    ),
                    child: Icon(
                      CupertinoIcons.clear,
                      color: Colors.white,
                      size: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .084,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TwitterSignOutButtonFace extends StatefulWidget {
  @override
  _TwitterSignOutButtonFaceState createState() =>
      _TwitterSignOutButtonFaceState();
}

class _TwitterSignOutButtonFaceState extends State<TwitterSignOutButtonFace> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: AppLocalizations.of(context)
          .translate("tooltipSignedinastwitter")
          .replaceAll("{username}", twitterUsername),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff1DA1F2),
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
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .0175,
            bottom: MediaQuery.of(context).size.height * .0175,
          ),
          child: Row(
            children: [
              Container(
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.height * .1) *
                    .083,
              ),
              Image(
                image: AssetImage("lib/images/twitter.png"),
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.height * .1) *
                    .084,
              ),
              Container(
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.height * .1) *
                    .0415,
              ),
              Container(
                width: (MediaQuery.of(context).size.width -
                        MediaQuery.of(context).size.height * .1) *
                    .583,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .583,
                      child: AutoSizeText(
                        twitterUsername,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * .03,
                        ),
                        maxLines: 1,
                        minFontSize: 1,
                        group: loginButtonTextSize,
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .583,
                      child: Opacity(
                        opacity: 0,
                        child: AutoSizeText(
                          AppLocalizations.of(context)
                              .translate("signinwithtwitter"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * .03,
                          ),
                          maxLines: 1,
                          minFontSize: 1,
                          group: loginButtonTextSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTwitterSignedIn = false;
                    twitterId = "";
                    twitterUsername = "";

                    storeTwitterLoginVariables();

                    _twitterLoginListener.value = "";
                  });
                },
                child: Tooltip(
                  message:
                      AppLocalizations.of(context).translate("tooltipSignout"),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .0415,
                      right: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .083,
                    ),
                    child: Icon(
                      CupertinoIcons.clear,
                      color: Colors.white,
                      size: (MediaQuery.of(context).size.width -
                              MediaQuery.of(context).size.height * .1) *
                          .084,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _activeFace() {
  _twitterLoginListener.value = "update";
  if (isTwitterSignedIn == true) {
    //return Text("signed in");
    return TwitterSignOutButtonFace();
  } else {
    return TwitterSignInButtonFace();
  }
}

class TwitterSignInButton extends StatefulWidget {
  @override
  _TwitterSignInButtonState createState() => _TwitterSignInButtonState();
}

class _TwitterSignInButtonState extends State<TwitterSignInButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (BuildContext context, String value, Widget child) {
        return _activeFace();
      },
      valueListenable: _twitterLoginListener,
    );
  }
}
