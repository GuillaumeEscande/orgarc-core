import 'archer.dart';
import 'departure.dart';

class Competition {
  final String id;
  final String name;
  List<Departure> departures;
  List<Archer> waitingArchers = const [];
  Competition(this.id, this.name, [this.departures = const []]);
}
