import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/src/api.dart';
import 'package:graphite_client/src/controller.dart';
import 'package:graphite_client/src/models/user.dart';
import 'package:graphite_client/src/types.dart';
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

  static final fields = {
    'id': String,
    'user': User,
    'courses': List<ID>,
  };

  factory Instructor.fromJson(Map<String, dynamic> json) =>
      _$InstructorFromJson(json);
}

class InstructorClient extends ApiClient<Instructor> {
  InstructorClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'instructor',
          fromJson: (json) => Instructor.fromJson(json),
        );
}

class InstructorController extends ApiController<Instructor, InstructorClient> {
  InstructorController(ProviderRef ref) : super(ref, api.instructor);
}
