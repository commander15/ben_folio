import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';

class TechnologyWidget extends StatelessWidget {
  final Technology technology;
  final System system;

  const TechnologyWidget({
    super.key,
    required this.technology,
    required this.system,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: technology.name,
      child: Image.network(
        '${system.cdn.options.baseUrl}${technology.logoPath}',
        //width: 32,
        height: 32,
        fit: BoxFit.contain,
      ),
    );
  }
}
