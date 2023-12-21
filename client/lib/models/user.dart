import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/types.dart';
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
          resource: 'users',
          fromJson: (json) => User.fromJson(json),
        );
}

class UserController extends ApiController<User, UserClient> {
  UserController(ProviderRef ref) : super(ref, api.user);
}
