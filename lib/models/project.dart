import 'package:ben_folio/models/model.dart';
import 'package:flutter/widgets.dart';

class Project extends Model {
  final String? logoPath;
  final String name;
  final String overview;
  final String? description;
  final Customer? customer;

  final List<ProgrammingLanguage> languages;
  final List<Technology> technologies;

  final List<Screenshot> screenshotsPaths;
  final List<Screencast>? screencastsPaths;

  bool get openSource => githubLink != null;
  final Uri? githubLink;

  const Project({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.logoPath,
    required this.name,
    required this.overview,
    this.description,
    this.customer,
    required this.languages,
    required this.technologies,
    required this.screenshotsPaths,
    this.screencastsPaths,
    this.githubLink,
  });

  Project.fromJson(super.json)
    : logoPath = json['logo_path'],
      name = json['name'],
      overview = json['overview'],
      description = json['description'],
      customer = json['customer'] == null ? null : Customer(name: 'ee'),
      languages = json['languages'] == null
          ? List.empty()
          : (json['languages'] as JsonArray)
                .map((e) => ProgrammingLanguage.fromJson(e))
                .toList(),
      technologies = json['technologies'] == null
          ? List.empty()
          : (json['technologies'] as JsonArray)
                .map((e) => Technology.fromJson(e))
                .toList(),
      screenshotsPaths = json['screenshots'] == null
          ? List.empty()
          : (json['screenshots'] as JsonArray)
                .map((e) => Screenshot.fromJson(e))
                .toList(),
      screencastsPaths = json['screencasts'] == null
          ? List.empty()
          : (json['screencasts'] as JsonArray)
                .map((e) => Screencast.fromJson(e))
                .toList(),
      githubLink = json['github_link'],
      super.fromJson();
}

class Customer extends Model {
  final String? logoPath;
  final String name;

  const Customer({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.logoPath,
    required this.name,
  });

  Customer.fromJson(super.json)
    : logoPath = json['logo_path'],
      name = json['name'],
      super.fromJson();
}

class TechThing extends Model {
  final String logoPath;
  final String name;

  const TechThing({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    required this.logoPath,
    required this.name,
  });

  TechThing.fromJson(super.object)
    : logoPath = object['logo_path'],
      name = object['name'],
      super.fromJson();
}

typedef ProgrammingLanguage = TechThing;
typedef Technology = TechThing;

class ScreenThing extends Model {
  final String? label;
  final String? description;
  final String path;

  const ScreenThing({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
    this.label,
    this.description,
    required this.path,
  });

  ScreenThing.fromJson(super.object)
    : label = object['label'],
      description = object['description'],
      path = object['path'],
      super.fromJson();
}

typedef Screencast = ScreenThing;
typedef Screenshot = ScreenThing;
