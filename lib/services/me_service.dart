import 'package:ben_folio/models/person.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/service.dart';

class MeService extends Service {
  MeService({required super.system});

  Future<ServiceResponse<Developer>> getMe() {
    final me = Developer(
      name: "Amadou Wanie",
      firstName: "Benjamain",
      presentationName: "Amadou Benjamain",
      nickName: "Commander",
      designation: "Ingenieur Logiciel",
      contacts: [
        Contact.linkedIn('https://www.linkedin.com/in/amadou-benjamain/'),
        Contact.email('amadoubenjamain@gmail.com'),
        Contact.mobile('+237 691 272 717'),
        Contact.github('commander15'),
      ],
      githubUserName: 'commander15',
      technologies: [
        Technology(name: 'Qt', logoPath: '/assets/images/logo_qt.png'),
        Technology(name: 'Flutter', logoPath: '/assets/images/logo_flutter.png'),
        Technology(name: 'Laravel', logoPath: '/assets/images/logo_laravel.png'),
        Technology(name: 'Django', logoPath: '/assets/images/logo_django.png'),
        Technology(name: 'Arduino', logoPath: '/assets/images/logo_arduino.png'),
        Technology(name: 'ESP-IDF', logoPath: '/assets/images/logo_espidf.png'),
        Technology(name: 'PlatformIO', logoPath: '/assets/images/logo_platformio.png'),
      ]
    );

    return Future.value(ServiceResponse(objects: [me]));
  }
}
