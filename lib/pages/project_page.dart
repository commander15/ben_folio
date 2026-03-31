import 'package:ben_folio/components/project_card.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/project_service.dart';
import 'package:ben_folio/services/service.dart';
import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  final Project project;
  final ProjectService projects;

  const ProjectPage({super.key, required this.project, required this.projects});

  @override
  State<StatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  late Future<ServiceResponse<Project>> project;
  bool projectLoaded = false;

  @override
  void initState() {
    super.initState();
    project = widget.projects.get(widget.project.id!);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: project, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return ProjectCard(project: snapshot.requireData.object!, system: widget.projects.system);
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }
    );
  }
}