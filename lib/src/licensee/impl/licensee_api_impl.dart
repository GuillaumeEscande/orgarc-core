import 'package:orgarc_core/src/licensee/interfaces/licensee_api.dart';
import 'package:orgarc_core/src/licensee/interfaces/licensee_storage.dart';
import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/licensee_service.dart';
import 'package:orgarc_core/src/licensee/service/reader/licensee_reader.dart';

class LicenseeApiImpl implements LicenseeApi {
  final LicenseeService _service;
  final LicenseeReader _reader;

  LicenseeApiImpl(this._service, this._reader);

  @override
  void retrieveLicensee() {
    _service.readLicensee(_reader);
  }

  @override
  List<Licensee> searchLicenseeByText(String searchRegexp) {
    return _service.searchLicenseeByText(searchRegexp);
  }

  @override
  Licensee getLicenseeByLicenceNumber(String licenceNumber) {
    return _service.getLicenseeByLicenceNumber(licenceNumber);
  }
}
