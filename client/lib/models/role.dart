import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Role({
    String? id,
    String? name,
  }) = _Role;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
}

class RoleClient extends ApiClient<Role> {
  RoleClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'roles',
          fromJson: (json) => Role.fromJson(json),
        );
}
