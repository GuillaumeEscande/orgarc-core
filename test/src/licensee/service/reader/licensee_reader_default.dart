import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/reader/licensee_reader.dart';

class LicenseeReaderDefault implements LicenseeReader {
  final List<Licensee> _licensees;
  LicenseeReaderDefault(this._licensees);

  @override
  List<Licensee> readLicensee() {
    return _licensees;
  }
}
