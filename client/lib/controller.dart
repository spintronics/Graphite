import 'package:graphite_client/api.dart';
import 'package:graphite_client/models/assignment.dart';
import 'package:graphite_client/models/catalog.dart';
import 'package:graphite_client/models/course.dart';
import 'package:graphite_client/models/instructor.dart';
import 'package:graphite_client/models/role.dart';
import 'package:graphite_client/models/session.dart';
import 'package:graphite_client/models/user.dart';
import 'package:graphite_client/state.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

abstract class Controller<T extends ApiObject> {
  final ProviderRef ref;
  Controller(this.ref);
  GraphiteState get state => ref.read(graphiteStateProvider);
  GraphiteStateNotifier get notifier =>
      ref.read(graphiteStateProvider.notifier);
}

// define a common controller for all state collections which are backed by an
// api object
class ApiController<Object extends ApiObject, Client extends ApiClient>
    extends Controller {
  final Client api;
  ApiController(super.ref, this.api);
  Future<void> create(Object object) async {
    final result = await api.create(object);
    if (result.id == null) return;
    super.notifier.addApiObject(result);
  }

  Future<void> findMany({Paging? paging}) async {
    paging ??= const Paging();
    final results = await api.findMany(paging);
    super.notifier.addApiObjects(results.items);
  }

  Future<void> find(String id) async {
    final result = await api.findFirst(id);
    if (result.id == null) return;
    super.notifier.addApiObject(result);
  }

  Future<void> update(Object assignment) async {
    final result = await api.update(assignment);
    if (result.id == null) return;
    super.notifier.addApiObject(result);
  }

  Future<void> delete(Object object) async {
    await api.delete(object.id!);
    super.notifier.removeApiObject(object);
  }
}

class GraphiteController {
  AssignmentController assignment;
  CatalogController catalog;
  CourseController course;
  InstructorController instructor;
  RoleController role;
  SessionController session;
  UserController user;
  GraphiteController(ProviderRef ref)
      : assignment = AssignmentController(ref),
        catalog = CatalogController(ref),
        course = CourseController(ref),
        instructor = InstructorController(ref),
        role = RoleController(ref),
        session = SessionController(ref),
        user = UserController(ref);
}

final graphiteControllerProvider = Provider<GraphiteController>((ref) {
  return GraphiteController(ref);
});
