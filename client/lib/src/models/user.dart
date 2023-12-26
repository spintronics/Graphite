import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/src/api.dart';
import 'package:graphite_client/src/controller.dart';
import 'package:graphite_client/src/types.dart';
import 'package:riverpod/riverpod.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory User({
    String? id,
    String? username,
    String? password,
    List<ID>? roles,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

class UserClient extends ApiClient<User> {
  UserClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'user',
          fromJson: (json) => User.fromJson(json),
        );
}

class UserController extends ApiController<User, UserClient> {
  UserController(ProviderRef ref) : super(ref, api.user);
}
