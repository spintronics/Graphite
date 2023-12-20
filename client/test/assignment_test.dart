// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/models/assignment.dart';
import 'package:graphite_client/state.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  final container = ProviderContainer();

  GraphiteState state() {
    return container.read(graphiteStateProvider);
  }

  GraphiteStateNotifier notifier() {
    return container.read(graphiteStateProvider.notifier);
  }

  GraphiteController controller() {
    return container.read(graphiteControllerProvider);
  }

  setUpAll(() async {
    await api.testing.createDB();
  });

  tearDownAll(() async {
    await api.testing.deleteDB();
    notifier().reset();
  });

  test('crud', () async {
    final assignment = Assignment(
      name: 'Assignment 1',
      description: 'Description 1',
      softDeadline: DateTime(2021, 9, 1).toIso8601String(),
      hardDeadline: DateTime(2021, 9, 2).toIso8601String(),
    );

    await controller().assignment.create(assignment);

    await controller().assignment.findMany();

    final s = state();

    expect(s.assignments.length, 1);
    expect(
      assignment.toJson()..remove('id'),
      s.assignments.values.first.toJson()..remove('id'),
    );
  });
}
