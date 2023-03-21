import 'package:orgarc_core/src/competition/model/competition.dart';

abstract class CompetitionStorage {
  void save(List<Competition> competitions);
  List<Competition> getAll();
  Competition getById(String id);
  void delete(List<Competition> competition);
}
