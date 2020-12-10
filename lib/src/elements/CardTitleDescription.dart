import 'package:flutter/material.dart';

class CardTitleDescription extends StatefulWidget {
  String title;
  String description;

  CardTitleDescription({Key key, this.title = "", this.description = ""})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CardTitleDescription();
  }
}

class _CardTitleDescription extends State<CardTitleDescription> {
  @override
  Widget build(BuildContext context) {
    String description = widget.description != null ? widget.description : "";
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.topLeft,
      margin:
          const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.transparent)),
        color: Colors.transparent,
      ),
      child: Container(
        //height: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  Text(
                    widget.title,
                    //overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    description,
                    //overflow: TextOverflow.ellipsis,
                    //softWrap: true,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
