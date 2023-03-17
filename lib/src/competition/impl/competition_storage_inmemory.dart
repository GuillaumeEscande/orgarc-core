import 'package:orgarc_core/src/competition/exceptions/competition_not_found_exception.dart';
import 'package:orgarc_core/src/competition/interfaces/competition_storage.dart';
import 'package:orgarc_core/src/competition/model/competition.dart';

class CompetitionStorageInMemory implements CompetitionStorage {
  final List<Competition> __competitions;
  CompetitionStorageInMemory() : __competitions = List.empty(growable: true);

  @override
  List<Competition> getAll() {
    return __competitions;
  }

  @override
  Competition getById(String id) {
    return __competitions.firstWhere(
      (element) => element.id == id,
      orElse: () => throw CompetitionNotFoundException(id),
    );
  }

  @override
  void save(List<Competition> competitions) {
    __competitions.addAll(competitions);
  }
}
