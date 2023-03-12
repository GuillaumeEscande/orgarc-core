import 'package:orgarc_core/src/licensee/model/licensee.dart';

abstract class LicenseeApi {
  void loadResultArcLicensee(String resultArcPath);
  List<Licensee> getLicenseeBySearch(String searchRegexp);
  Licensee getLicenseeByLicenceNumber(String licenceNumber);
}
