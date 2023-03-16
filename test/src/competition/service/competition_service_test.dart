import 'package:orgarc_core/src/competition/interfaces/competition_storage.dart';
import 'package:orgarc_core/src/competition/service/competition_service.dart';
import 'package:test/test.dart';

import 'competition_storage_inmemory.dart';

void main() {
  group('Tests of CompetitionService', () {
    test('Test instanciate service', () {
      CompetitionStorage storage = CompetitionStorageInMemory();
      CompetitionService service = CompetitionService(storage);

      expect(service.getAllCompetitions(), equals(List.empty()));
    });
  });
}
