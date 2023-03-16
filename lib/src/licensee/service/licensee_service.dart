import 'package:orgarc_core/src/licensee/exceptions/licensee_not_found_exception.dart';
import 'package:orgarc_core/src/licensee/interfaces/licensee_storage.dart';
import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/reader/licensee_reader.dart';

class LicenseeService {
  final LicenseeStorage _storage;

  LicenseeService(this._storage);

  void readLicensee(LicenseeReader reader) {
    List<Licensee> licensees = reader.readLicensee();
    _storage.saveAllLicensees(licensees);
  }

  List<Licensee> searchLicenseeByText(String searchCriteria) {
    List<Licensee> licensees = _storage.getAllLicensees();

    List<Licensee> result = [];

    for (var licensee in licensees) {
      if (_checkLicenseeSearch(licensee, searchCriteria)) {
        result.add(licensee);
      }
    }

    return result;
  }

  bool _checkLicenseeSearch(Licensee licensee, String searchCriteria) {
    var lowerSearchCriteria = searchCriteria.toLowerCase();

    if (_checkLicenseeElementValeurSearch(
        licensee.firstname, lowerSearchCriteria)) {
      return true;
    }

    if (_checkLicenseeElementValeurSearch(
        licensee.lastname, lowerSearchCriteria)) {
      return true;
    }

    return false;
  }

  bool _checkLicenseeElementValeurSearch(
      String elementValue, String lowerSearchCriteria) {
    var lowerElementValue = elementValue.toLowerCase();
    if (lowerElementValue.contains(lowerSearchCriteria)) {
      return true;
    }
    return false;
  }

  Licensee getLicenseeByLicenceNumber(String licenceNumber) {
    List<Licensee> licensees = _storage.getAllLicensees();

    var lowerLicenceNumber = licenceNumber.toLowerCase();

    for (var licensee in licensees) {
      if (licensee.licenceNumber.toLowerCase().compareTo(lowerLicenceNumber) ==
          0) {
        return licensee;
      }
    }
    throw LicenseeNotFoundException(" licenceNumber = $licenceNumber");
  }
}
