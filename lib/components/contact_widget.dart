import 'package:ben_folio/models/person.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;

  const ContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Tooltip(message: contact.value, child: contact.icon ?? Icon(FontAwesomeIcons.question));
  }
}