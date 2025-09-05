import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Project {
  final String? logoPath;
  final String name;
  final String overview;
  final String? description;
  final Customer? customer;

  final List<ProgrammingLanguage> languages;
  final List<Technology> technologies;

  final List<String> screenshotsPaths;
  final List<String>? screencastsPaths;

  bool get openSource => githubLink != null;
  final Uri? githubLink;

  const Project({this.logoPath, required this.name, required this.overview, this.description, this.customer, required this.languages, required this.technologies, required this.screenshotsPaths, this.screencastsPaths, this.githubLink});
}

class Customer {
  final String? logoPath;
  final String name;

  const Customer({this.logoPath, required this.name});
}

class ProgrammingLanguage {
  final Widget icon;
  final String name;

  const ProgrammingLanguage({required this.icon, required this.name});

  factory ProgrammingLanguage.qml() => ProgrammingLanguage.helper(logo: 'logo_qml.png', name: 'QML');
  factory ProgrammingLanguage.js() => ProgrammingLanguage.helper(logo: 'logo_js.png', name: 'JavaScript');
  factory ProgrammingLanguage.php() => ProgrammingLanguage.helper(logo: 'logo_php.png', name: 'PHP');
  factory ProgrammingLanguage.cpp() => ProgrammingLanguage.helper(logo: 'logo_cpp.png', name: 'C++');
  factory ProgrammingLanguage.c() => ProgrammingLanguage.helper(logo: 'logo_c.png', name: 'C');
  factory ProgrammingLanguage.dart() => ProgrammingLanguage.helper(logo: 'logo_dart.png', width: 128, name: 'Dart');

  factory ProgrammingLanguage.helper({required String logo, required String name, double? width, double? height}) => ProgrammingLanguage(icon: Image.asset('images/$logo', width: width, height: height), name: name);
}

class Technology {
  final Widget icon;
  final String name;

  const Technology({required this.icon, required this.name});

  factory Technology.qt({Color? color, double? size}) => Technology.custom(logo: 'logo_qt.png', name: 'Qt');
  factory Technology.flutter() => Technology.standard(logo: FontAwesomeIcons.flutter, name: 'Flutter');

  factory Technology.laravel({Color? color, double? size}) => Technology.custom(logo: 'logo_laravel.png', rounded: true, name: 'Laravel');
  factory Technology.django({Color? color, double? size}) => Technology.custom(logo: 'logo_django.png', rounded: true, name: 'Django');

  factory Technology.arduino() => Technology.custom(logo: 'logo_arduino.png', name: 'Arduino');
  factory Technology.espidf() => Technology.custom(logo: 'logo_espressif.png', rounded: true, width: 92, name: 'ESP IDF');

  factory Technology.platformio() => Technology.custom(logo: 'logo_platformio.png', name: 'PlatformIO');

  factory Technology.textual({required String name}) => Technology(icon: Text(name, style: TextStyle(fontWeight: FontWeight.bold),), name: name);

  factory Technology.custom({required String logo, required String name, bool rounded = false, double width = 32, double height = 32}) {
    Widget widget = Image.asset("images/$logo", width: width, height: height);
    if (rounded) {
      widget = ClipRRect(borderRadius: BorderRadius.circular(32.0), child: widget);
    }
    return Technology(icon: widget, name: name);
  }

  factory Technology.standard({required IconData logo, required String name, Color? color, double? size}) => Technology(icon: Icon(logo, color: color, size: size), name: name);
}