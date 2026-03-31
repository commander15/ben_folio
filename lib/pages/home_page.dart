import 'package:ben_folio/components/developer_card.dart';
import 'package:ben_folio/components/responsive_builder.dart';
import 'package:ben_folio/services/me_service.dart';
import 'package:ben_folio/services/project_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final void Function() onResumeDownloadTap;
  final void Function() onProjectsTap;
  final MeService me;
  final ProjectService projects;

  const HomePage({
    super.key,
    required this.me,
    required this.projects,
    required this.onResumeDownloadTap,
    required this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      desktopBuilder: (context, constraints) =>
          SingleChildScrollView(child: buildContent(context, addSpacer: true)),
      mobileBuilder: (context, constraints) =>
          SingleChildScrollView(child: buildContent(context, addSpacer: false)),
    );
  }

  Widget buildContent(BuildContext context, {required bool addSpacer}) {
    Widget pureContent = Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children:
            [
              FutureBuilder(
                future: me.getMe(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DeveloperCard(
                      developer: snapshot.requireData.object!,
                      system: me.system,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: 16.0),
              /*SizedBox(
                height: (screen.orientation == Orientation.portrait ? 500 : 500),
                child: FutureBuilder(
                  future: projects.index(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final projects = snapshot.requireData.objects!;

                      return ListView.builder(
                        itemBuilder: (context, index) => Padding(padding: EdgeInsets.all(8.0), child: ProjectCard(project: projects[index])),
                        itemCount: projects.length,
                        itemExtent: MediaQuery.of(context).size.width * 0.8,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ), */
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: onResumeDownloadTap,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    children: [
                      Icon(Icons.download_rounded),
                      Text('Télécharger mon CV'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () => (onProjectsTap != null ? onProjectsTap!() : null),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8.0,
                    children: [
                      Icon(Icons.explore_rounded),
                      Text('Découvrir mes projets'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
            ] + [ if (addSpacer) Spacer() ]
      ),
    );

    return SingleChildScrollView(child: pureContent);
  }
}
