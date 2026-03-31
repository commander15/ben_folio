import 'package:ben_folio/models/model.dart';
import 'package:ben_folio/models/project.dart';
import 'package:ben_folio/services/service.dart';

class TechService extends Service {
  List<Technology>? _techs;

  TechService({required super.system});

  Future<ServiceResponse<Technology>> index() async {
    if (_techs != null && _techs!.isNotEmpty) {
      return ServiceResponse(objects: _techs);
    }

    final response = await system.cdn.get('/assets/data/technologies.json');
    final responseData = response.data as JsonObject;
    final techsData = responseData['data'] as JsonArray;

    _techs = List.generate(techsData.length, (index) {
      return Technology.fromJson(techsData[index]);      
    });

    return ServiceResponse(objects: _techs);
  }
}