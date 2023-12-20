import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/models/assignment.dart';
import 'package:graphite_client/models/catalog.dart';
import 'package:graphite_client/models/course.dart';
import 'package:graphite_client/models/instructor.dart';
import 'package:graphite_client/models/role.dart';
import 'package:graphite_client/models/session.dart';
import 'package:graphite_client/models/user.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

part 'state.freezed.dart';
part 'state.g.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());

@freezed
class GraphiteState with _$GraphiteState {
  @JsonSerializable(explicitToJson: true)
  factory GraphiteState({
    required Session session,
    required Map<ID, Assignment> assignments,
    required Map<ID, Catalog> catalogs,
    required Map<ID, Course> courses,
    required Map<ID, Instructor> instructors,
    required Map<ID, User> users,
    required Map<ID, Role> roles,
  }) = _GraphiteState;

  factory GraphiteState.fromJson(Map<String, dynamic> json) =>
      _$GraphiteStateFromJson(json);
}

class GraphiteStateNotifier extends Notifier<GraphiteState> {
  @override
  GraphiteState build() {
    return GraphiteState(
      session: Session(id: ''),
      assignments: {},
      catalogs: {},
      courses: {},
      instructors: {},
      users: {},
      roles: {},
    );
  }

  void reset() {
    state = build();
  }

  void update({
    Session? session,
    Map<ID, Assignment>? assignments,
    Map<ID, Catalog>? catalogs,
    Map<ID, Course>? courses,
    Map<ID, Instructor>? instructors,
    Map<ID, User>? users,
    Map<ID, Role>? roles,
  }) {
    state = state.copyWith(
      session: session ?? state.session,
      assignments: assignments ?? state.assignments,
      catalogs: catalogs ?? state.catalogs,
      courses: courses ?? state.courses,
      instructors: instructors ?? state.instructors,
      users: users ?? state.users,
      roles: roles ?? state.roles,
    );
  }

  void persist() {
    storage.write(key: 'state', value: jsonEncode(state.toJson()));
  }

  void load() async {
    final json = await storage.read(key: 'state');
    if (json != null) {
      state = GraphiteState.fromJson(jsonDecode(json));
    }
  }
}

final graphiteStateProvider =
    NotifierProvider<GraphiteStateNotifier, GraphiteState>(() {
  return GraphiteStateNotifier();
});
