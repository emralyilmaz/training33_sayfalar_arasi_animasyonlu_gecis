import 'package:flutter/material.dart';
import 'dart:math' as math;

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Git"),
            onPressed: () {
              Navigator.of(context).push(yonlenmeOlustur());
            }),
      ),
    );
  }
}

Route yonlenmeOlustur() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondayAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondayAnimation, child) {
        var begin = Offset.fromDirection(-50, 0.5);
        // fromDirection(math.pi, 1) olsaydı sağdan sola,
        // fromDirection(-math.pi, 1) olsaydı soldan sağa,
        // fromDirection(math.pi/2, 1) olsaydı aşağıdan yukarı,
        // fromDirection(-math.pi/2, 1) olsaydı yukarıdan aşağı,
        // var begin = Offset(0.0, 1.0);
        // ilkparametre:konumu ile ilgili(randyan tipi), 2.parametre 0.0 -1.0 görünürlüğü ile ilgili.
        var end = Offset.zero;
        var tween = Tween(begin: begin, end: end);
        var offSetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offSetAnimation,
          child: child,
        );
      });
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page2"),
      ),
    );
  }
}
