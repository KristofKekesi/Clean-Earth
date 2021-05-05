import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class Article extends StatelessWidget {
  final String title;

  const Article({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .0175),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(
              (MediaQuery.of(context).size.height +
                      MediaQuery.of(context).size.width) /
                  2 *
                  .025),
        ),
        width: (MediaQuery.of(context).size.height +
                MediaQuery.of(context).size.width) /
            2 *
            .86,
        child: Padding(
          padding: EdgeInsets.all(
            MediaQuery.of(context).size.height * .0175,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Padding(
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.height * (.05 + .015),),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).translate("articleabout"),
                    style: TextStyle(
                      color: Color(0xff53786F),
                      fontSize: MediaQuery.of(context).size.height * .025,
                    ),
                  ),
                  AutoSizeText(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff53786F),
                      fontSize: MediaQuery.of(context).size.height * .03,
                    ),
                    maxLines: 3,
                  ),
                ],),
              ),
              Align(
                alignment: Alignment.centerRight,
                child:  Tooltip(
                  message: AppLocalizations.of(context)
                      .translate("tooltipArticleButton"),
                  child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.height * .015,
                  ),
                  child: Icon(
                    CupertinoIcons.right_chevron,
                    color: Color(0xff53786F),
                    size: MediaQuery.of(context).size.height * .05,
                  ),
                ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

class Articles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: .85,
        maxChildSize: 1,
        builder: (BuildContext context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: ClipRRect(
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
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * .05,
                    right: MediaQuery.of(context).size.height * .05,
                    top: MediaQuery.of(context).size.height * .05,
                    bottom: MediaQuery.of(context).size.height * .0325,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height * .0175,
                        ),
                        child: Text(
                          AppLocalizations.of(context).translate("articles"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * .04,
                          ),
                        ),
                      ),
                      Article(
                        title: "Plastic free living",
                      ),
                      Article(
                        title: "Recycling",
                      ),
                      Article(
                        title: "Pollution",
                      ),
                      Article(
                        title: "Illegal trash dumping",
                      ),
                      Article(
                        title: "Garbage collection",
                      ),
                      Article(
                        title: "Selective waste collection",
                      ),
                      Article(
                        title: "Microplastic",
                      ),
                      Article(
                        title: "The Great Pacific garbage patch",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
