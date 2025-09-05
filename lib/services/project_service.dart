import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/service.dart';

class ProjectService extends Service {
  late List<Project> _projects;

  ProjectService({required super.system}) {
    final blueRemote = Project(
      logoPath: '/blue_remote/logo.png',
      name: 'Blue Remote',
      overview: 'Linking IR and BLE.',
      description:
          'Blue Remote is .... blabl alagjglsqjglmsdjfklgjksdmfjgldjfglmsdjgflmsdgfklgsdmlgfdl',
      languages: [
        ProgrammingLanguage.cpp(),
        ProgrammingLanguage.c(),
        ProgrammingLanguage.dart(),
      ],
      technologies: [
        Technology.flutter(),
        Technology.django(),
        Technology.arduino(),
        Technology.espidf(),
        Technology.platformio(),
      ],
      screenshotsPaths: [
        "/blue_remote/screenshots/1.home.png",
        "/blue_remote/screenshots/2.profiles.png",
        "/blue_remote/screenshots/3.canal+.png",
        "/blue_remote/screenshots/4.digits.png",
        "/blue_remote/screenshots/5.hisense.png",
        "/blue_remote/screenshots/6.colors.png",
        "/blue_remote/screenshots/7.smart.png",
        "/blue_remote/screenshots/8.hex.png",
        "/blue_remote/screenshots/9.protocol.png",
      ],
    );

    final test = Project(
      logoPath: '/blue_remote/logo.png',
      name: "Sodec Sure",
      overview: 'Insurance app',
      customer: Customer(logoPath: '/sodec_sure/SODECOTON.png', name: 'SODECOTON'),
      languages: [ProgrammingLanguage.cpp(), ProgrammingLanguage.c(), ProgrammingLanguage.php()],
      technologies: [Technology.qt(), Technology.laravel()],
      screenshotsPaths: [],
    );

    _projects = [blueRemote, test];
  }

  Future<ServiceResponse<Project>> index() {
    return Future.value(ServiceResponse(objects: _projects));
  }

  Future<ServiceResponse<Project>> get(int id) {
    return Future.value(ServiceResponse(objects: [_projects[id - 1]]));
  }
}
