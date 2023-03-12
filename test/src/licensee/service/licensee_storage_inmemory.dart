import 'package:orgarc_core/src/licensee/interfaces/licensee_storage.dart';
import 'package:orgarc_core/src/licensee/model/licensee.dart';

class LicenseeStorageInMemory implements LicenseeStorage {
  List<Licensee> _licensees;
  LicenseeStorageInMemory() : _licensees = List.empty();

  @override
  List<Licensee> getAllLicensees() {
    return _licensees;
  }

  @override
  void saveAllLicensees(List<Licensee> licenseees) {
    this._licensees = licenseees;
  }
}