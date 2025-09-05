import 'package:ben_folio/models/project.dart';
import 'package:flutter/material.dart';

class TechnologyWidget extends StatelessWidget {
  final Technology technology;

  const TechnologyWidget({super.key, required this.technology});

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: technology.name, child: technology.icon);
  }
}