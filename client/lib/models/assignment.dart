import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

part 'assignment.freezed.dart';
part 'assignment.g.dart';

@freezed
class Assignment with _$Assignment implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Assignment({
    String? id,
    String? name,
    String? description,
    @JsonKey(name: 'soft_deadline') String? softDeadline,
    @JsonKey(name: 'hard_deadline') String? hardDeadline,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
}

class AssignmentClient extends ApiClient<Assignment> {
  AssignmentClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'assignment',
          fromJson: (json) => Assignment.fromJson(json),
        );
}

class AssignmentController extends ApiController<Assignment, AssignmentClient> {
  AssignmentController(ProviderRef ref) : super(ref, api.assignment);
}
