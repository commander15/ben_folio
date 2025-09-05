import 'package:ben_folio/models/project.dart';
import 'package:flutter/material.dart';

class ProgrammingLanguageWidget extends StatelessWidget {
  final ProgrammingLanguage language;

  const ProgrammingLanguageWidget({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: language.name, child: language.icon);
  }
}