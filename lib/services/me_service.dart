import 'package:ben_folio/models/person.dart';
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
    );

    return Future.value(ServiceResponse(objects: [me]));
  }
}
