import 'club.dart';

class Licensee {
  final String licenceNumber;
  final String lastname;
  final String firstname;
  final String sexe;
  final String category;
  final Club club;

  Licensee(this.licenceNumber, this.lastname, this.firstname, this.sexe,
      this.category, this.club);
}
