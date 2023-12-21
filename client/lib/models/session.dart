import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/models/user.dart';
import 'package:riverpod/riverpod.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Session({
    String? id,
    User? name,
    String? token,
    DateTime? expiration,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

class SessionClient extends ApiClient<Session> {
  SessionClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'sessions',
          fromJson: (json) => Session.fromJson(json),
        );
}

class SessionController extends ApiController<Session, SessionClient> {
  SessionController(ProviderRef ref) : super(ref, api.session);
}
