import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyweb/src/helpers/HexColor.dart';

class Loader extends StatefulWidget {
  String type;
  String color;

  Loader({Key key, this.type = "", this.color = ""}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _Loader();
  }
}

class _Loader extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    String type = widget.type;
    String color = widget.color;

    Widget loader;
    switch (type) {
      case "RotatingPlain":
        loader = SpinKitRotatingPlain(
          color: HexColor(color),
          size: 100.0,
        );
        break;

      case "FadingFour":
        loader = SpinKitFadingFour(
          color: HexColor(color),
          size: 100.0,
        );
        break;

      case "FadingCube":
        loader = SpinKitFadingCube(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "Pulse":
        loader = SpinKitPulse(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "ChasingDots":
        loader = SpinKitChasingDots(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "ThreeBounce":
        loader = SpinKitThreeBounce(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "Circle":
        loader = SpinKitCircle(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "CubeGrid":
        loader = SpinKitCubeGrid(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "FadingCircle":
        loader = SpinKitFadingCircle(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "FoldingCube":
        loader = SpinKitFoldingCube(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "PumpingHeart":
        loader = SpinKitPumpingHeart(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "DualRing":
        loader = SpinKitDualRing(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "HourGlass":
        loader = SpinKitHourGlass(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "FadingGrid":
        loader = SpinKitFadingGrid(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "Ring":
        loader = SpinKitRing(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "Ripple":
        loader = SpinKitRipple(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "SpinningCircle":
        loader = SpinKitSpinningCircle(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "SquareCircle":
        loader = SpinKitSquareCircle(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "WanderingCubes":
        loader = SpinKitWanderingCubes(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "Wave":
        loader = SpinKitWave(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "DoubleBounce":
        loader = SpinKitDoubleBounce(
          color: HexColor(color),
          size: 100.0,
        );
        break;
      case "empty":
        loader = Container();
        break;
      default:
        loader = Container();
        break;
    }

    return loader;
  }
}
