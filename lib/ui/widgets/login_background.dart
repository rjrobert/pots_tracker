import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pots_trackr/ui/shared/app_colors.dart';
import 'package:pots_trackr/ui/shared/ui_helpers.dart';

class LoginBackgroud extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: ClipPath(
              clipper: MyClipper(),
              child:
                  // new Image(
                  //   image: AssetImage('assets/images/logo.png'),
                  // ),
                  Stack(
                children: <Widget>[
                  new Container(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        colors: [nearlyBlue, grey],
                      ),
                    ),
                  ),
                  new Center(
                      child: SizedBox(
                          height: screenHeightFraction(context, dividedBy: 8),
                          width: screenHeightFraction(context, dividedBy: 2),
                          child: new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundColor: nearlyWhite,
                            radius: 100.0,
                            child: FaIcon(FontAwesomeIcons.heartbeat,
                                color: Colors.white, size: 50.0),
                          )))
                ],
              ),
            ),
          ),
          new Flexible(flex: 3, child: new Container())
        ],
      );
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
