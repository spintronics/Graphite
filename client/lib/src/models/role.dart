import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/src/api.dart';
import 'package:graphite_client/src/controller.dart';
import 'package:riverpod/riverpod.dart';

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
          resource: 'role',
          fromJson: (json) => Role.fromJson(json),
        );
}

class RoleController extends ApiController<Role, RoleClient> {
  RoleController(ProviderRef ref) : super(ref, api.role);
}
