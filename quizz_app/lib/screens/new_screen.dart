import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipPath(
              clipper: TheMClipper(),
              child: Container(
                height: 150,
                width: 200,
                color: Color.fromARGB(255, 57, 45, 168),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TheClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 4, size.height / 1.5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TheMClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.1);
    path.lineTo(size.width / 3.5, size.height / 2);
    path.lineTo(size.width / 2.4, size.height / 1.5);
    path.lineTo(size.width / 1.6, size.height / 2.8);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
