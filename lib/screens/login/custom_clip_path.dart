import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    Path path0 = Path();
    path0.moveTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.1385000,size.height*0.7360000,size.width*0.2497250,size.height*0.7133286);
    path0.cubicTo(size.width*0.3699500,size.height*0.7102143,size.width*0.4366750,size.height*0.9341143,size.width*0.6233333,size.height*0.9214286);
    path0.quadraticBezierTo(size.width*0.7333750,size.height*0.9062429,size.width,size.height*0.7085714);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 232, 245, 231)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(Offset(0,size.height*0.50),Offset(size.width,size.height*0.50),[Color(0xff628cf2),Color(0xff34f250),Color(
        0xffc9e7c9)],[0.00,0.53,1.00]);

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.quadraticBezierTo(size.width*0.0134333,size.height*0.3411714,size.width*0.1025250,size.height*0.4899286);
    path0.cubicTo(size.width*0.1637417,size.height*0.5704714,size.width*0.2027083,size.height*0.6092429,size.width*0.2497833,size.height*0.6471143);
    path0.quadraticBezierTo(size.width*0.3366167,size.height*0.7145571,size.width,size.height*0.6997571);
    path0.lineTo(size.width,size.height);
    path0.lineTo(0,size.height);
    path0.lineTo(0,0);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}



