import 'package:orgarc_core/src/licensee/exceptions/licensee_not_found_exception.dart';
import 'package:orgarc_core/src/licensee/interfaces/licensee_storage.dart';
import 'package:orgarc_core/src/licensee/model/club.dart';
import 'package:orgarc_core/src/licensee/model/licensee.dart';
import 'package:orgarc_core/src/licensee/service/licensee_service.dart';
import 'package:test/test.dart';

import 'licensee_storage_inmemory.dart';
import 'reader/licensee_reader_default.dart';

void main() {
  group('Tests of readLicensee method ', () {
    test('Import empty list of licensees', () {
      LicenseeStorage storage = LicenseeStorageInMemory();
      LicenseeService service = LicenseeService(storage);

      List<Licensee> licensees = [];
      service.readLicensee(LicenseeReaderDefault(licensees));

      List<Licensee> results = service.getLicenseeBySearch("");
      expect(results, equals(licensees));
    });
  });

  group('Tests of getLicenseeBySearch method ', () {
    LicenseeStorage storage = LicenseeStorageInMemory();
    LicenseeService service = LicenseeService(storage);
    Licensee paul =
        Licensee("1234", "Paul", "CoolName", "M", "SHCL", Club("club", 0));
    Licensee george =
        Licensee("5679", "George", "Buddy", "M", "SHCL", Club("club", 0));
    Licensee rick =
        Licensee("3456", "Rick", "NameSpace", "M", "SHCL", Club("club", 0));
    List<Licensee> licensees = [
      paul,
      george,
      rick,
    ];

    setUp(() {
      service.readLicensee(LicenseeReaderDefault(licensees));
    });

    test('Search licensees without text', () {
      List<Licensee> results = service.getLicenseeBySearch("");
      expect(results, equals(licensees));
    });

    test('Search licensees without text', () {
      List<Licensee> results = service.getLicenseeBySearch("");
      expect(results, equals(licensees));
    });
    test('Search licensees by exact firstname', () {
      List<Licensee> results = service.getLicenseeBySearch(george.firstname);
      expect(results, equals([george]));
    });
    test('Search licensees by firstname, without upper letter', () {
      List<Licensee> results =
          service.getLicenseeBySearch(george.firstname.toLowerCase());
      expect(results, equals([george]));
    });
    test('Search licensees by substring of firstname', () {
      List<Licensee> results = service.getLicenseeBySearch("name");
      expect(results, equals([paul, rick]));
    });
    test('Search licensees by exact lastname', () {
      List<Licensee> results = service.getLicenseeBySearch(george.lastname);
      expect(results, equals([george]));
    });
    test('Search licensees by lastname, without upper letter', () {
      List<Licensee> results =
          service.getLicenseeBySearch(george.lastname.toLowerCase());
      expect(results, equals([george]));
    });
    test('Search licensees by substring of lastname', () {
      List<Licensee> results = service.getLicenseeBySearch("ul");
      expect(results, equals([paul]));
    });
  });
  group('Tests of getLicenseeByLicenceNumber method ', () {
    LicenseeStorage storage = LicenseeStorageInMemory();
    LicenseeService service = LicenseeService(storage);
    Licensee paul =
        Licensee("1234", "Paul", "CoolName", "M", "SHCL", Club("club", 0));
    Licensee george =
        Licensee("5679", "George", "Buddy", "M", "SHCL", Club("club", 0));
    Licensee rick =
        Licensee("3456", "Rick", "NameSpace", "M", "SHCL", Club("club", 0));
    List<Licensee> licensees = [
      paul,
      george,
      rick,
    ];

    setUp(() {
      service.readLicensee(LicenseeReaderDefault(licensees));
    });

    test('Search existing licensee', () {
      Licensee result = service.getLicenseeByLicenceNumber("1234");
      expect(result, equals(paul));
    });
    test('Search not existing licensee', () {
      expect(() => service.getLicenseeByLicenceNumber("00"),
          throwsA(TypeMatcher<LicenseeNotFoundException>()));
    });
  });
}
