import 'package:orgarc_core/src/competition/model/competition.dart';

abstract class CompetitionApi {
  List<Competition> getAllCompetitions();
  Competition getCompetitionById(String id);
  Competition createCompetition(String name);
  void updateCompetition(Competition competition);
}
