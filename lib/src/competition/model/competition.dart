import 'package:equatable/equatable.dart';

import 'archer.dart';
import 'departure.dart';

class Competition extends Equatable {
  final String id;
  final String name;
  final List<Departure> departures;
  final List<Archer> waitingArchers;

  Competition(this.id, this.name,
      [this.departures = const [], this.waitingArchers = const []]);

  @override
  List<Object?> get props => [id];

  Competition copyWith(
          {String? nameIn,
          List<Departure>? departuresIn,
          List<Archer>? waitingArchersIn}) =>
      Competition(id, nameIn ?? name, departuresIn ?? departures,
          waitingArchersIn ?? waitingArchers);
}
