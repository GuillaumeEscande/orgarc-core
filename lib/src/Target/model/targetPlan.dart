
import 'archerPlacement.dart';
import 'target.dart';

class TargetPlan {
  final Target target;
  List<ArcherPlacement> archers;
  TargetPlan(this.target, [this.archers = const []]);
}