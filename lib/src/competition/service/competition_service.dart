import 'package:orgarc_core/src/competition/interfaces/competition_storage.dart';
import 'dart:math';

import 'package:orgarc_core/src/competition/model/competition.dart';

class CompetitionService {
  final CompetitionStorage _storage;

  CompetitionService(this._storage);

  List<Competition> getAllCompetitions() {
    return _storage.getAll();
  }

  Competition getCompetitionById(String id) {
    return _storage.getById(id);
  }

  void updateCompetition(Competition competition) {
    _storage.save([competition]);
  }

  Competition createCompetition(String name) {
    return Competition(_generateId(), name);
  }

  static String _generateId() {
    Random random = Random(DateTime.now().millisecond);

    final String hexDigits = "0123456789abcdef";
    final List<String> uuid = List<String>.generate(36, (index) {
      final int hexPos = random.nextInt(16);
      return hexDigits.substring(hexPos, hexPos + 1);
    });

    int pos = (int.parse(uuid[19], radix: 16) & 0x3) |
        0x8; // bits 6-7 of the clock_seq_hi_and_reserved to 01

    uuid[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
    uuid[19] = hexDigits.substring(pos, pos + 1);

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = "-";

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }
}
