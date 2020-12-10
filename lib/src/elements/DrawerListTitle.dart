import 'package:flutter/material.dart';
import 'package:flyweb/i18n/i18n.dart';

class DrawerListTitle extends StatefulWidget {
  String icon_url;
  IconData icon;
  String text;
  Function onTap;

  DrawerListTitle(
      {Key key,
      this.icon_url = "",
      this.icon = Icons.edit,
      this.text = "",
      this.onTap})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DrawerListTitle();
  }
}

class _DrawerListTitle extends State<DrawerListTitle> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 15.0, color: Colors.grey[700]),
      ),
      leading: _renderIcon(widget.icon_url, widget.icon),
      trailing: Icon(
        I18n.current.textDirection == TextDirection.ltr
            ? Icons.keyboard_arrow_right
            : Icons.keyboard_arrow_left,
        color: Colors.grey[400],
      ),
      onTap: widget.onTap,
    );
  }
/*@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[50]))),
      child: InkWell(
        splashColor: Colors.grey[50],
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    _renderIcon(widget.icon_url, widget.icon),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        widget.text,
                        style:
                            TextStyle(fontSize: 16.0, color: Colors.grey[700]),
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  */
}

Widget _renderIcon(icon_url, icon) {
  return icon_url != ""
      ? Image.network(
          icon_url,
          width: 20,
          height: 20,
        )
      : Icon(
          icon,
          color: Colors.grey[700],
        );
}
