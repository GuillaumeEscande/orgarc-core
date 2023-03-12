import 'package:orgarc_core/src/licensee/model/licensee.dart';

import 'licensee_reader.dart';

class ResultArcReader implements LicenseeReader {
  final String _resultarcPath;
  ResultArcReader(this._resultarcPath);

  @override
  List<Licensee> readLicensee() {
    List<Licensee> licensees = List.empty();
    return licensees;
  }
}
