import 'package:orgarc_core/src/competition/model/competition.dart';

class CompetitionApi {
  Competition createCompetition(String name){
    return Competition(name);
  }
}