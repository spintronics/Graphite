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
import 'package:graphite_client/models/catalog.dart';
import 'package:graphite_client/models/course.dart';
import 'package:graphite_client/models/instructor.dart';
import 'package:graphite_client/models/user.dart';
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

  group('crud', () async {
    test('assignment', () async {
      // create an assignment
      final assignment = Assignment(
        name: 'Assignment 1',
        description: 'Description 1',
        softDeadline: DateTime(2021, 9, 1).toIso8601String(),
        hardDeadline: DateTime(2021, 9, 2).toIso8601String(),
      );

      await controller().assignment.create(assignment);

      await controller().assignment.findMany();

      // verify that the assignment was created
      expect(state().assignments.length, 1);
      expect(
        assignment.toJson()..remove('id'),
        state().assignments.values.first.toJson()..remove('id'),
      );

      final apiAssignment =
          assignment.copyWith(id: state().assignments.keys.first);

      await controller().assignment.find(apiAssignment.id!);

      expect(state().assignments.length, 1);
      expect(
        apiAssignment.toJson(),
        state().assignments.values.first.toJson(),
      );

      // update the assignment
      final updatedAssignment = apiAssignment.copyWith(
        name: 'Assignment 2',
        description: 'Description 2',
        softDeadline: DateTime(2021, 9, 3).toIso8601String(),
        hardDeadline: DateTime(2021, 9, 4).toIso8601String(),
      );

      await controller().assignment.update(updatedAssignment);

      await controller().assignment.find(updatedAssignment.id!);

      expect(state().assignments.length, 1);
      expect(
        updatedAssignment.toJson(),
        state().assignments.values.first.toJson(),
      );
      // delete the assignment
      await controller().assignment.delete(updatedAssignment);

      notifier().reset();

      await controller().assignment.findMany();

      expect(state().assignments.length, 0);
    });

    test('catalog', () async {
      // create a catalog
      final catalog = Catalog(
        name: 'Catalog 1',
        description: 'Description 1',
      );

      await controller().catalog.create(catalog);

      await controller().catalog.findMany();

      // verify that the catalog was created
      expect(state().catalogs.length, 1);
      expect(
        catalog.toJson()..remove('id'),
        state().catalogs.values.first.toJson()..remove('id'),
      );

      final apiCatalog = catalog.copyWith(id: state().catalogs.keys.first);

      await controller().catalog.find(apiCatalog.id!);

      expect(state().catalogs.length, 1);
      expect(
        apiCatalog.toJson(),
        state().catalogs.values.first.toJson(),
      );

      // update the catalog
      final updatedCatalog = apiCatalog.copyWith(
        name: 'Catalog 2',
        description: 'Description 2',
      );

      await controller().catalog.update(updatedCatalog);

      await controller().catalog.find(updatedCatalog.id!);

      expect(state().catalogs.length, 1);
      expect(
        updatedCatalog.toJson(),
        state().catalogs.values.first.toJson(),
      );
      // delete the catalog
      await controller().catalog.delete(updatedCatalog);

      notifier().reset();

      await controller().catalog.findMany();

      expect(state().catalogs.length, 0);
    });

    test('course', () async {
      // create a course
      final course = Course(
        name: 'Course 1',
        description: 'Description 1',
      );

      await controller().course.create(course);

      await controller().course.findMany();

      // verify that the course was created
      expect(state().courses.length, 1);
      expect(
        course.toJson()..remove('id'),
        state().courses.values.first.toJson()..remove('id'),
      );

      final apiCourse = course.copyWith(id: state().courses.keys.first);

      await controller().course.find(apiCourse.id!);

      expect(state().courses.length, 1);
      expect(
        apiCourse.toJson(),
        state().courses.values.first.toJson(),
      );

      // update the course
      final updatedCourse = apiCourse.copyWith(
        name: 'Course 2',
        description: 'Description 2',
      );

      await controller().course.update(updatedCourse);

      await controller().course.find(updatedCourse.id!);

      expect(state().courses.length, 1);
      expect(
        updatedCourse.toJson(),
        state().courses.values.first.toJson(),
      );
      // delete the course
      await controller().course.delete(updatedCourse);

      notifier().reset();

      await controller().course.findMany();

      expect(state().courses.length, 0);
    });

    // test('instructor', () async {
    //   // create an instructor
    //   final instructor = Instructor(
    //     name: 'Instructor 1',
    //     description: 'Description 1',
    //   );

    //   await controller().instructor.create(instructor);

    //   await controller().instructor.findMany();

    //   // verify that the instructor was created
    //   expect(state().instructors.length, 1);
    //   expect(
    //     instructor.toJson()..remove('id'),
    //     state().instructors.values.first.toJson()..remove('id'),
    //   );

    //   final apiInstructor = instructor.copyWith(id: state().instructors.keys.first);

    //   await controller().instructor.find(apiInstructor.id!);

    //   expect(state().instructors.length, 1);
    //   expect(
    //     apiInstructor.toJson(),
    //     state().instructors.values.first.toJson(),
    //   );

    //   // update the instructor
    //   final updatedInstructor = apiInstructor.copyWith(
    //     name: 'Instructor 2',
    //     description: 'Description 2',
    //   );

    //   await controller().instructor.update(updatedInstructor);

    //   await controller().instructor.find(updatedInstructor.id!);

    //   expect(state().instructors.length, 1);
    //   expect(
    //     updatedInstructor.toJson(),
    //     state().instructors.values.first.toJson(),
    //   );
    //   // delete the instructor
    //   await controller().instructor.delete(updatedInstructor);

    //   notifier().reset();

    //   await controller().instructor.findMany();

    //   expect(state().instructors.length, 0);
    // });

    test('user', () async {
      // create a user
      final user = User(
        username: 'User 1',
        password: 'password',
      );

      await controller().user.create(user);

      await controller().user.findMany();

      // verify that the user was created
      expect(state().users.length, 1);
      expect(
        user.toJson()..remove('id'),
        state().users.values.first.toJson()..remove('id'),
      );

      final apiUser = user.copyWith(id: state().users.keys.first);

      await controller().user.find(apiUser.id!);

      expect(state().users.length, 1);
      expect(
        apiUser.toJson(),
        state().users.values.first.toJson(),
      );

      // update the user
      final updatedUser = apiUser.copyWith(
        username: 'User 2',
        password: 'password!',
      );

      await controller().user.update(updatedUser);

      await controller().user.find(updatedUser.id!);

      expect(state().users.length, 1);
      expect(
        updatedUser.toJson(),
        state().users.values.first.toJson(),
      );
      // delete the user
      await controller().user.delete(updatedUser);

      notifier().reset();

      await controller().user.findMany();

      expect(state().users.length, 0);
    });
  });
}
