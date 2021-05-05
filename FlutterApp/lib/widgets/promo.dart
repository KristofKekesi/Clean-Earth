import 'dart:io';

import 'package:cleanearth/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'localization.dart';

class Application extends StatelessWidget {
  final String name;
  final String redirect;
  final String image;

  const Application({Key key, this.name, this.redirect, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _launchURL(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      }
    }

    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .025),
      child: Tooltip(
        message: name,
        child: GestureDetector(
          child: GestureDetector(
            onTap: () {
              _launchURL(redirect);
            },
            child: Image(
              image: NetworkImage(image),
              width: MediaQuery.of(context).size.height * .10,
              height: MediaQuery.of(context).size.height * .10,
            ),
          ),
        ),
      ),
    );
  }
}

class PromoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: connectionStatus(),
        // a previously-obtained Future<String> or null
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == true) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height * (.0175 + .05),
                      right: MediaQuery.of(context).size.height * (.0175 + .05),
                    ),
                    child: Text(
                      AppLocalizations.of(context).translate("more"),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * .04,
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xfff2f2f2),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.height * .05,
                        ),
                        Application(
                          name: "Elements",
                          redirect:
                              "https://play.google.com/store/apps/details?id=com.kristofkekesi.elements",
                          image:
                              "https://play-lh.googleusercontent.com/uLZHtNEMYGNJrNiQ5vku85fX2dLS85Qnfhl3jEKluN5m5vLxR-1G4r6gQoC9W5gP-0g=s180-rw",
                        ),
                        Application(
                          name: "Preacher",
                          redirect:
                              "https://play.google.com/store/apps/details?id=com.kristofkekesi.preacher",
                          image:
                              "https://play-lh.googleusercontent.com/v-HoxSuPTB4XxQ_1Z8UGJV3eUjUqJ7D9bnNol8FaO-zZQ1jm04vBVxF_Ns5HDA7kg7E=s180-rw",
                        ),
                        Application(
                          name: "NASA Mira",
                          redirect:
                              "https://play.google.com/store/apps/details?id=com.kristofkekesi.nasamira",
                          image:
                              "https://play-lh.googleusercontent.com/5fosGp6zjFsa8pyy44UwosS8mEDdCG2e77wyqiQmyugReagRIxIzgH5alkDAwsWI7tM=s180-rw",
                        ),
                        Container(
                          width: MediaQuery.of(context).size.height * .05,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
