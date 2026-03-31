import 'package:ben_folio/components/responsive_builder.dart';
import 'package:ben_folio/pages/home_page.dart';
import 'package:ben_folio/pages/projects_page.dart';
import 'package:ben_folio/services/me_service.dart';
import 'package:ben_folio/services/project_service.dart';
import 'package:ben_folio/services/system.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  final System system;

  const MainPage({super.key, required this.system});

  @override
  State createState() => _MainPageState();
}

class MainPageItem {
  final Widget icon;
  final String label;
  final Widget widget;

  const MainPageItem({
    required this.icon,
    required this.label,
    required this.widget,
  });
}

class _MainPageState extends State<MainPage> {
  int _index = 0;
  late List<MainPageItem> _items;

  late MeService meService;
  late ProjectService projectsService;

  @override
  void initState() {
    super.initState();

    meService = MeService(system: widget.system);
    projectsService = ProjectService(system: widget.system);

    _items = [
      MainPageItem(
        icon: Icon(FontAwesomeIcons.house),
        label: "Home",
        widget: HomePage(
          me: meService,
          projects: projectsService,
          onResumeDownloadTap: openResume,
          onProjectsTap: () => setPage(1),
        ),
      ),
      MainPageItem(
        icon: Icon(FontAwesomeIcons.folder),
        label: "Projects",
        widget: ProjectsPage(projectsService: projectsService),
      ),
      MainPageItem(
        icon: Icon(FontAwesomeIcons.addressBook),
        label: "Contacts",
        widget: Center(child: Text("Contacts")),
      ),
    ];
  }

  void setPage(int index) {
    setState(() {
      _index = index;
    });
  }

  void openResume() {
    launchUrl(
      Uri.parse(
        'https://drive.google.com/file/d/1Gq0MRVya_QGUNKQtNpcu5PopmrOWgerO/view?usp=sharing',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      desktopBuilder: buildForDesktop,
      mobileBuilder: buildForMobile,
    );
  }

  Widget buildLogo(BuildContext context) {
    return CircleAvatar(
            child: Text('AB', style: TextStyle(fontSize: 24)),
          );
  }

  Widget buildResumeButton(BuildContext context) {
    return ElevatedButton(
      onPressed: openResume,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.download_rounded), Text("CV")],
      ),
    );
  }

  Widget buildForDesktop(BuildContext context, BoxConstraints constraints) {
    final List<NavigationRailDestination> destinations = List.generate(
      _items.length,
      (index) {
        final MainPageItem item = _items[index];
        return NavigationRailDestination(
          icon: item.icon,
          label: Text(item.label),
        );
      },
      growable: false,
    );

    return Scaffold(
      floatingActionButton: buildResumeButton(context),
      body: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.0,),
              buildLogo(context),
              SizedBox(height: 8.0,),
              Expanded(
                child: NavigationRail(
                  labelType: NavigationRailLabelType.all,
                  onDestinationSelected: setPage,
                  destinations: destinations,
                  selectedIndex: _index,
                ),
              ),
            ],
          ),
          Expanded(child: buildPage(context, _index)),
        ],
      ),
    );
  }

  Widget buildForMobile(BuildContext context, BoxConstraints constraints) {
    final List<BottomNavigationBarItem> items = List.generate(_items.length, (
      index,
    ) {
      final MainPageItem item = _items[index];
      return BottomNavigationBarItem(icon: item.icon, label: item.label);
    }, growable: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: Container(
          margin: EdgeInsets.only(left: 6.0, right: 6.0),
          child: buildLogo(context),
        ),
        title: Text("Amadou Benjamain"),
        actions: [buildResumeButton(context)],
      ),
      body: buildPage(context, _index),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).focusColor,
        currentIndex: _index,
        onTap: setPage,
        items: items,
      ),
    );
  }

  Widget buildPage(BuildContext context, int index) {
    return _items[index].widget;
  }
}
