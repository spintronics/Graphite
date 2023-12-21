import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/models/user.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

part 'instructor.freezed.dart';
part 'instructor.g.dart';

@freezed
class Instructor with _$Instructor implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Instructor({
    String? id,
    User? user,
    List<ID>? courses,
  }) = _Instructor;

  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);
}

class InstructorClient extends ApiClient<Instructor> {
  InstructorClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'instructors',
          fromJson: (json) => Instructor.fromJson(json),
        );
}

class InstructorController extends ApiController<Instructor, InstructorClient> {
  InstructorController(ProviderRef ref) : super(ref, api.instructor);
}
