import 'coatOfArm.dart';

class Target {
  final int id;
  int distance;
  List<CoatOfArm> coatOfArms;

  Target(this.id, this.distance, [this.coatOfArms = const []]);
}