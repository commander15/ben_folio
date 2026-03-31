import 'package:ben_folio/models/model.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Person extends Model {
  final String? photoPath;

  final String name;
  final String? firstName;
  final String? presentationName;
  final String? nickName;

  final String designation;

  final List<Contact>? contacts;

  const Person({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.photoPath,
    required this.name,
    this.firstName,
    this.presentationName,
    this.nickName,
    required this.designation,
    this.contacts,
  });

  Person.fromJson(super.json)
    : photoPath = json['photo_path'],
      name = json['name'],
      firstName = json['first_name'],
      presentationName = json['presentation_name'],
      nickName = json['nickname'],
      designation = json['designation'],
      contacts = json['contacts'] == null ? null : (json['contacts'] as JsonArray).map((e) => Contact.fromJson(e)).toList(),
      super.fromJson();
}

class Contact extends Model {
  final String? label;
  final String value;
  final String type;

  const Contact({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.label,
    required this.value,
    required this.type,
  });

  factory Contact.mobile(
    String phone, {
    String? label,
    double? size,
    Color? color,
  }) => Contact.generic(
    phone,
    'phone',
    icon: Icons.phone_rounded,
    size: size,
    color: color,
    label: label ?? 'Mobile',
  );

  factory Contact.email(
    String address, {
    String? label,
    double? size,
    Color? color,
  }) => Contact.generic(
    address,
    'email',
    icon: Icons.mail_rounded,
    color: color,
    size: size,
    label: label ?? 'Email',
  );

  factory Contact.linkedIn(
    String link, {
    String? label,
    double? size,
    Color? color,
  }) => Contact.generic(
    link,
    'linkedin',
    icon: FontAwesomeIcons.linkedin,
    size: size,
    color: color,
    label: label ?? "LinkedIn",
  );

  factory Contact.github(String username, {String? label}) => Contact.generic(
    username,
    'github',
    label: label ?? username,
    icon: FontAwesomeIcons.github,
  );

  factory Contact.generic(
    String value,
    String type, {
    IconData? icon,
    String? label,
    double? size,
    Color? color,
  }) => Contact(
    label: label,
    value: value,
    type: type,
  );

  Contact.fromJson(super.json)
    : label = json['label'] ?? json['type'],
      value = json['value'],
      type = ((json['type'] ?? 'unknown') as String).toLowerCase(),
      super.fromJson();

  IconData adaptedIcon() {
    switch (type) {
      case 'phone':
        return Icons.phone_rounded;

      case 'email':
        return Icons.email_rounded;

      case 'github':
        return FontAwesomeIcons.github;

      case 'linkedin':
        return FontAwesomeIcons.linkedin;

      default:
        return FontAwesomeIcons.question;
    }
  }

  Future<bool> trigger() {
    switch (type) {
      case 'phone':
        return launchUrl(Uri.parse("tel:$value"));

      case 'email':
        return launchUrl(Uri.parse("mailto:$value"));

      case 'github':
        return launchUrl(Uri.parse("https://github.com/$value"));

      case 'linkedin':
      default:
        return launchUrl(Uri.parse(value));
    }
  }
}

class Developer extends Person {
  final String? githubUserName;
  final List<Technology>? technologies;

  const Developer({
    super.photoPath,
    required super.name,
    super.firstName,
    super.presentationName,
    super.nickName,
    required super.designation,
    super.contacts,
    this.githubUserName,
    this.technologies
  });
}
