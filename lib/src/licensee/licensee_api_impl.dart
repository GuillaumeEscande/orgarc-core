import 'package:orgarc_core/src/licensee/interfaces/licensee_api.dart';
import 'package:orgarc_core/src/licensee/interfaces/licensee_storage.dart';
import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/licensee_service.dart';
import 'package:orgarc_core/src/licensee/service/reader/licensee_reader.dart';
import 'package:orgarc_core/src/licensee/service/reader/resultarc_reader.dart';

class LicenseeApiImpl implements LicenseeApi {
  final LicenseeService _service;

  LicenseeApiImpl(LicenseeStorage storage)
      : _service = LicenseeService(storage);

  @override
  void loadResultArcLicensee(String resultArcPath) {
    LicenseeReader reader = ResultArcReader(resultArcPath);
    _service.readLicensee(reader);
  }

  @override
  List<Licensee> getLicenseeBySearch(String searchRegexp) {
    return _service.getLicenseeBySearch(searchRegexp);
  }
}
