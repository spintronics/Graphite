import 'package:graphite_client/api.dart';
import 'package:graphite_client/models/assignment.dart';
import 'package:graphite_client/state.dart';
import 'package:riverpod/riverpod.dart';

abstract class Controller<T extends ApiObject> {
  final ProviderRef ref;
  Controller(this.ref);
  GraphiteState get state => ref.read(graphiteStateProvider);
  GraphiteStateNotifier get notifier =>
      ref.read(graphiteStateProvider.notifier);
}

class GraphiteController {
  AssignmentController assignment;
  GraphiteController(ProviderRef ref) : assignment = AssignmentController(ref);
}

final graphiteControllerProvider = Provider<GraphiteController>((ref) {
  return GraphiteController(ref);
});
