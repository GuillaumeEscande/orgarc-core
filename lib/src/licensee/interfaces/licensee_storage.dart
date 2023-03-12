import 'package:orgarc_core/src/licensee/model/licensee.dart';

abstract class LicenseeStorage {
  void saveAllLicensees(List<Licensee> licenseees);
  List<Licensee> getAllLicensees();
}
