import 'dart:convert';
import 'package:graphite_client/models/assignment.dart';
import 'package:graphite_client/models/catalog.dart';
import 'package:graphite_client/models/course.dart';
import 'package:graphite_client/models/instructor.dart';
import 'package:graphite_client/models/role.dart';
import 'package:graphite_client/models/session.dart';
import 'package:graphite_client/models/user.dart';
import 'package:dio/dio.dart';
import 'package:graphite_client/types.dart';

final dio = Dio();

abstract class ApiObject {
  String? get id;
  Map<String, dynamic> toJson();
}

class TestingClient {
  String baseUrl;
  Api api;
  String testDB = '';
  TestingClient({required this.baseUrl, required this.api});
  Future<void> createDB() async {
    final response = await dio.get(
      '$baseUrl/db',
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create test database');
    }
    api.headers['X-Test-DB'] = response.data;
    testDB = response.data;
  }

  Future<void> deleteDB() async {
    if (testDB == '') return;

    final response = await dio.delete(
      '$baseUrl/db/$testDB',
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete test database');
    }
  }
}

class Api {
  final baseUrl = 'http://localhost:5000/api/v1';
  late final AssignmentClient assignment;
  late final CatalogClient catalog;
  late final CourseClient course;
  late final InstructorClient instructor;
  late final RoleClient role;
  late final SessionClient session;
  late final UserClient user;
  late final TestingClient testing;
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Api({
    AssignmentClient? assignment,
    CatalogClient? catalog,
    CourseClient? course,
    InstructorClient? instructor,
    RoleClient? role,
    SessionClient? session,
    UserClient? user,
    TestingClient? testing,
  }) {
    this.assignment = assignment ?? AssignmentClient(baseUrl: baseUrl);
    this.catalog = catalog ?? CatalogClient(baseUrl: baseUrl);
    this.course = course ?? CourseClient(baseUrl: baseUrl);
    this.instructor = instructor ?? InstructorClient(baseUrl: baseUrl);
    this.role = role ?? RoleClient(baseUrl: baseUrl);
    this.session = session ?? SessionClient(baseUrl: baseUrl);
    this.user = user ?? UserClient(baseUrl: baseUrl);
    this.testing = testing ?? TestingClient(baseUrl: baseUrl, api: this);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers.addAll(headers);
          return handler.next(options);
        },
      ),
    );
  }
}

class PagedCollection<T extends ApiObject> {
  final List<T> items;
  final int? total;
  final int page;
  final int pageSize;
  const PagedCollection({
    required this.items,
    required this.total,
    required this.page,
    required this.pageSize,
  });
}

abstract class ApiClient<T extends ApiObject> {
  String baseUrl;
  String resource;
  T Function(Map<String, dynamic>) fromJson;
  ApiClient({
    required this.baseUrl,
    required this.resource,
    required this.fromJson,
  });

  // create a common request method so that we can persist headers

  Future<T> findFirst(int id) async {
    final response = await dio.get('$baseUrl/$resource/$id');
    if (response.statusCode == 200) {
      return fromJson(response.data);
    } else {
      throw Exception('Failed to find $resource');
    }
  }

  Future<T> create(
    T obj, {
    Map<String, dynamic> Function(T store)? toJson,
  }) async {
    final response = await dio.post(
      '$baseUrl/$resource',
      data: json.encode(toJson == null ? (obj.toJson()) : toJson(obj)),
      // options: Options(
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //   },
      // ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to create $resource');
    }

    return fromJson(response.data);
  }

  Future<void> update(T store) async {
    final response = await dio.put(
      '$baseUrl/$resource/${store.id}',
      data: json.encode(store.toJson()),
      // options: Options(
      //   headers: {
      //     'Content-Type': 'application/json',
      //     'Accept': 'application/json',
      //   },
      // ),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update store');
    }
  }

  Future<void> delete(T store) async {
    final response = await dio.delete(
      '$baseUrl/$resource/${store.id}',
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete store');
    }
  }

  Future<PagedCollection<T>> findMany(Paging paging) async {
    final response = await dio.get(
      '$baseUrl/$resource',
      queryParameters: {
        'page': paging.page,
        'pageSize': paging.pageSize,
      },
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json',
      // },
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;
      return PagedCollection<T>(
        items: data.map<T>((store) => fromJson(store)).toList(),
        total: null,
        page: paging.page,
        pageSize: paging.pageSize,
      );
    } else {
      throw Exception('Failed to search $resource');
    }
  }
}

final api = Api();
