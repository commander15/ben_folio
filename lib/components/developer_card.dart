import 'package:ben_folio/components/contact_widget.dart';
import 'package:ben_folio/components/technology_widget.dart';
import 'package:ben_folio/models/person.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';

class DeveloperCard extends StatelessWidget {
  final Developer developer;
  final System system;

  const DeveloperCard({super.key, required this.developer, required this.system});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(32.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1024) {
            return buildForDesktop(context, constraints);
          } else {
            return buildForMobile(context);
          }
        },
      ),
    );
  }

  Widget buildForDesktop(BuildContext context, BoxConstraints constraints) {
    return buildBase(
      context,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildAvatar(context),
          SizedBox(width: 16.0),
          Expanded(
            child: buildProfile(
              context,
              constraints: constraints,
              centerTitles: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildForMobile(BuildContext context) {
    return buildBase(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildAvatar(context),
          Expanded(child: buildProfile(context, centerTitles: true)),
        ],
      ),
    );
  }

  Widget buildAvatar(BuildContext context) {
    ImageProvider photo = (developer.photoPath == null
        ? AssetImage('images/dev_profile.jpeg')
        : NetworkImage(developer.photoPath!));

    return ClipRRect(
      borderRadius: BorderRadius.circular(500),
      child: Image(image: photo, height: 200),
    );
  }

  Widget buildProfile(
    BuildContext context, {
    BoxConstraints? constraints,
    bool centerTitles = false,
  }) {
    double factor = 1.0;

    // Titles
    List<Widget> titles = [
      Text(
        developer.presentationName ?? developer.name,
        style: TextStyle(fontSize: 32 * factor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      Text(
        developer.designation,
        style: TextStyle(fontSize: 20 * factor, fontStyle: FontStyle.italic),
        textAlign: TextAlign.center,
      ),
    ];

    if (centerTitles) {
      titles = titles.map((e) => Center(child: e) as Widget).toList();
    }

    // Tech stack
    final List<Technology> stack = developer.technologies ?? List.empty();

    List<Widget> techs = List.generate(stack.length, (index) {
      return TechnologyWidget(technology: stack[index], system: system);
    }, growable: false);

    // Contacts
    List<Widget> contacts = List.generate(developer.contacts?.length ?? 0, (
      index,
    ) {
      final Contact contact = developer.contacts![index];
      return IconButton(
        onPressed: () => contact.trigger(),
        icon: ContactWidget(contact: contact),
      );
    }, growable: false);

    late List<Widget> lastLines;
    if (!centerTitles) {
      lastLines = [
        Row(spacing: 8.0, children: techs + [Spacer() as Widget] + contacts),
      ];
    } else {
      lastLines = [
        SizedBox(height: 16.0),
        Center(child: Wrap(alignment: WrapAlignment.center, spacing: 8.0, children: techs)),
        SizedBox(height: 8.0),
        Center(child: Wrap(alignment: WrapAlignment.center, spacing: 8.0, children: contacts)),
      ];
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          titles +
          [
            SizedBox(height: 16),
            Text(
              "Ingénieur orienté solution, je développe et intègre des applications multiplateformes (PC, mobile, web) avec une solide maîtrise du volet analytique et conceptuel. J'apporte également une expertise en micrologiciel pour systèmes embarqués (standard et IoT).",
              style: TextStyle(fontSize: 14 * factor),
            ),
            Spacer(),
          ] + lastLines,
    );
  }

  Widget buildBase(BuildContext context, Widget widget) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(32.0),
      child: IntrinsicHeight(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.3,
              child: Image(
                image: AssetImage('images/dev_background.jpeg'),
                fit: BoxFit.cover,
                height: 128,
              ),
            ),
            Container(margin: EdgeInsets.all(16.0), child: widget),
          ],
        ),
      ),
    );
  }
}
