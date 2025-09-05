import 'dart:math';

import 'package:ben_folio/components/screenshot_widget.dart';
import 'package:ben_folio/models/project.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: IntrinsicHeight(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background Image or Placeholder
              Container(color: Colors.grey[200]),

              // Content Overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54],
                  ),
                ),
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Title and Logo
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (project.logoPath != null)
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              "projects${project.logoPath!}",
                            ),
                          ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                project.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                project.overview,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        if (project.customer != null &&
                            project.customer!.logoPath != null)
                          Tooltip(
                            message: project.customer!.name,
                            child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              "projects${project.customer!.logoPath}",
                            ),
                          ),
                          ),
                      ],
                    ),

                    if (project.screenshotsPaths.isNotEmpty)
                      SizedBox(height: 16.0),

                    // Screenshot or spacer
                    if (project.screenshotsPaths.isNotEmpty)
                      SizedBox(
                        height: 256,
                        child: Expanded(
                          child: Center(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: ScreenshotWidget(
                                    path: project.screenshotsPaths[index],
                                    size: 256,
                                  ),
                                );
                              },
                              itemCount: min(
                                3,
                                project.screenshotsPaths.length,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      )
                    else
                      Spacer(),

                    if (project.screenshotsPaths.isNotEmpty)
                      SizedBox(height: 16.0),

                    // Description
                    if (project.description != null)
                      Text(
                        project.description!,
                        style: TextStyle(color: Colors.white70),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    SizedBox(height: 16.0),

                    // Technologies and Links
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          ...project.technologies.map(
                            (tech) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Tooltip(
                                message: tech.name,
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: tech.icon,
                                ),
                              ),
                            ),
                          ),
                          if (project.githubLink != null)
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                              ),
                              onPressed: () => launchUrl(project.githubLink!),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> launchUrl(Uri url) async {
  if (!await canLaunchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  await launchUrl(url);
}
