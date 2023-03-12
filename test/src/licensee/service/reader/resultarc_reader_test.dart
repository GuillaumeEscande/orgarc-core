import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/reader/resultarc_reader.dart';
import 'package:test/test.dart';

void main() {
  test('Read exemple Resultarc database', () {
    ResultArcReader reader = ResultArcReader("testwx");

    List<Licensee> licensees = reader.readLicensee();

    //expect(licensees.length, equals(1));
  });
}
