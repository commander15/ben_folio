import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';

class ProgrammingLanguageWidget extends StatelessWidget {
  final ProgrammingLanguage language;
  final System system;

  const ProgrammingLanguageWidget({super.key, required this.language, required this.system});

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: language.name, child: Image.network(
        '${system.cdn.options.baseUrl}${language.logoPath}',
        width: 32,
        height: 32,
      ));
  }
}