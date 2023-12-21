import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/models/catalog.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Course({
    String? id,
    String? name,
    String? description,
    Catalog? catalog,
    List<ID>? assignments,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

class CourseClient extends ApiClient<Course> {
  CourseClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'courses',
          fromJson: (json) => Course.fromJson(json),
        );
}

class CourseController extends ApiController<Course, CourseClient> {
  CourseController(ProviderRef ref) : super(ref, api.course);
}
