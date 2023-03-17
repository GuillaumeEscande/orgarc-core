import 'package:orgarc_core/src/competition/exceptions/competition_not_found_exception.dart';
import 'package:orgarc_core/src/competition/impl/competition_storage_inmemory.dart';
import 'package:orgarc_core/src/competition/interfaces/competition_storage.dart';
import 'package:orgarc_core/src/competition/model/competition.dart';
import 'package:orgarc_core/src/competition/service/competition_service.dart';
import 'package:test/test.dart';

void main() {
  group('Tests of CompetitionService', () {
    test('Test instanciate service', () {
      CompetitionStorage storage = CompetitionStorageInMemory();
      CompetitionService service = CompetitionService(storage);

      expect(service.getAllCompetitions(), equals(List.empty()));
    });
  });

  group('Tests of getAllCompetitions method ', () {
    CompetitionStorage storage = CompetitionStorageInMemory();
    CompetitionService service = CompetitionService(storage);

    Competition comp1 = Competition("comp_id_1", "comp1");
    Competition comp2 = Competition("comp_id_2", "comp2");
    List<Competition> competitions = [comp1, comp2];

    setUp(() {
      storage.save(competitions);
    });

    test('test getAllCompetitions', () {
      List<Competition> results = service.getAllCompetitions();
      expect(results, equals(competitions));
    });
  });

  group('Tests of Competition crud method ', () {
    CompetitionStorage storage = CompetitionStorageInMemory();
    CompetitionService service = CompetitionService(storage);

    Competition comp1 = Competition("comp_id_1", "comp1");
    Competition comp2 = Competition("comp_id_2", "comp2");
    List<Competition> competitions = [comp1, comp2];

    setUp(() {
      storage.save(competitions);
    });

    test('Test getCompetitionById exact', () {
      expect(service.getCompetitionById("comp_id_1"), equals(comp1));
      expect(service.getCompetitionById("comp_id_2"), equals(comp2));
    });

    test('Test getCompetitionById erone', () {
      expect(() => service.getCompetitionById("comp_id"),
          throwsA(TypeMatcher<CompetitionNotFoundException>()));
    });

    test('Test createCompetition erone', () {
      Competition comp = service.createCompetition("new_comp");
      expect(comp.id, isNotEmpty);
    });

    test('Test updateCompetition erone', () {
      Competition comp = service.getCompetitionById("comp_id_1");
      expect(comp.name, equals("comp1"));
      comp.name = "new name";
      service.updateCompetition(comp);
      expect(service.getCompetitionById("comp_id_1").name, equals("new name"));
    });
  });
}
