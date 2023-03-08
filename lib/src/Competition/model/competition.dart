
import 'archer.dart';
import 'departure.dart';

class Competition {
  final String name;
  List<Departure> departures;
  List<Archer> waitingArchers = const [];
  Competition(this.name, [this.departures = const []]);
}
