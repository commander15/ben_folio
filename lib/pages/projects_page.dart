import 'package:ben_folio/components/project_card.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/project_service.dart';
import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  final ProjectService projectsService;

  const ProjectsPage({super.key, required this.projectsService});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.info_outline_rounded, color: Colors.red, size: 64,),
        Center(
      child: Text('Not ready yet !', style: TextStyle(fontSize: 18),),
    )
      ],
    );

    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: projectsService.index(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Project> projects = snapshot.requireData.objects!;
                return ListView.builder(
                  itemBuilder: (context, index) =>
                      ProjectCard(project: projects[index], system: projectsService.system),
                  itemCount: projects.length,
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
