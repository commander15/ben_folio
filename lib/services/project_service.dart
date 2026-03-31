import 'package:ben_folio/models/model.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/service.dart';

class ProjectService extends Service {
  List<Project>? _projects;

  ProjectService({required super.system});

  Future<ServiceResponse<Project>> index() async {
    if (_projects != null) {
      return ServiceResponse(objects: _projects);
    }

    _projects = List.empty(growable: true);

    final indexResponse = await system.cdn.get('/projects/index.json');
    final projects = indexResponse.data['data'] as JsonArray;

    for (JsonObject project in projects) {
      final projectDataResponse = await system.cdn.get('/projects/${project['name']}/manifest.json');
      final projectObject = Project.fromJson(projectDataResponse.data);
      _projects!.add(projectObject);
    }
    
    return ServiceResponse(objects: _projects);
  }

  Future<ServiceResponse<Project>> get(int id) async {
    if (_projects == null || id < 1 || id >= _projects!.length) {
      return ServiceResponse(objects: []);
    }

    return ServiceResponse(objects: [_projects![id - 1]]);
  }
}
