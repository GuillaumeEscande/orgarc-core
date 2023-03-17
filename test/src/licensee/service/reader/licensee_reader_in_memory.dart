import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/reader/licensee_reader.dart';

class LicenseeReaderInMemory implements LicenseeReader {
  final List<Licensee> _licensees;
  LicenseeReaderInMemory(this._licensees);

  @override
  List<Licensee> readLicensee() {
    return _licensees;
  }
}
