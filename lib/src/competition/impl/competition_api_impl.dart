import 'package:orgarc_core/src/competition/interfaces/competition_api.dart';
import 'package:orgarc_core/src/competition/interfaces/competition_storage.dart';
import 'package:orgarc_core/src/competition/model/competition.dart';
import 'package:orgarc_core/src/competition/service/competition_service.dart';

class CompetitionApiImpl implements CompetitionApi {
  final CompetitionService _service;

  CompetitionApiImpl(CompetitionStorage storage)
      : _service = CompetitionService(storage);

  @override
  List<Competition> getAllCompetitions() {
    return _service.getAllCompetitions();
  }

  @override
  Competition getCompetitionById(String id) {
    return _service.getCompetitionById(id);
  }

  @override
  Competition createCompetition(String name) {
    return _service.createCompetition(name);
  }

  @override
  void updateCompetition(Competition competition) {
    _service.updateCompetition(competition);
  }

  @override
  void deleteCompetition(Competition competition) {
    _service.deleteCompetition(competition);
  }
}
