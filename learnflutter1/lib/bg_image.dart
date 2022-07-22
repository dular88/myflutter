import 'package:flutter/material.dart';

class BGImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("phpmailer.png",
        fit: BoxFit.cover,
        color: Colors.black.withOpacity(0.7),
        colorBlendMode: BlendMode.darken);
  }
}
