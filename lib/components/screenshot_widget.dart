import 'package:flutter/material.dart';

class ScreenshotWidget extends StatelessWidget {
  final String path;
  final double? size;

  const ScreenshotWidget({super.key, required this.path, this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset("projects$path", fit: BoxFit.contain, height: size),
    );
  }
}
