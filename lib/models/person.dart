import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Person {
  final String? photoUrl;

  final String name;
  final String? firstName;
  final String? presentationName;
  final String? nickName;

  final String designation;

  final List<Contact>? contacts;

  const Person({this.photoUrl, required this.name, this.firstName, this.presentationName, this.nickName, required this.designation, this.contacts});
}

class Contact {
  final Widget? icon;
  final String? label;
  final String value;
  final String type;

  const Contact({this.icon, this.label, required this.value, required this.type});

  factory Contact.mobile(String phone, {String? label, double? size, Color ?color}) => Contact.generic(phone, 'phone', icon: Icons.phone_rounded, size: size, color: color, label: label ?? 'Mobile');
  factory Contact.email(String address, {String? label, double? size, Color ?color}) => Contact.generic(address, 'email', icon: Icons.mail_rounded, color: color, size: size, label: label ?? 'Email');
  factory Contact.linkedIn(String link, {String ?label, double? size, Color ?color}) => Contact.generic(link, 'linkedin', icon: FontAwesomeIcons.linkedin, size: size, color: color, label: label ?? "LinkedIn");
  factory Contact.github(String username, {String? label}) => Contact.generic(username, 'github', label: label ?? username, icon: FontAwesomeIcons.github);
  factory Contact.generic(String value, String type, {IconData? icon, String ?label, double? size, Color ?color}) => Contact(icon: Icon(icon ?? Icons.contact_page_rounded, size: size, color: color), label: label, value: value, type: type);

  Future<bool> contact() {
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

  const Developer({super.photoUrl, required super.name, super.firstName, super.presentationName, super.nickName, required super.designation, super.contacts, this.githubUserName});
}