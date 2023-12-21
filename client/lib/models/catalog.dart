import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graphite_client/api.dart';
import 'package:graphite_client/controller.dart';
import 'package:graphite_client/types.dart';
import 'package:riverpod/riverpod.dart';

part 'catalog.freezed.dart';
part 'catalog.g.dart';

@freezed
class Catalog with _$Catalog implements ApiObject {
  @JsonSerializable(explicitToJson: true)
  factory Catalog({
    String? id,
    String? name,
    String? description,
    @JsonKey(name: 'soft_deadline') String? softDeadline,
    @JsonKey(name: 'hard_deadline') String? hardDeadline,
    List<ID>? courses,
  }) = _Catalog;

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
}

class CatalogClient extends ApiClient<Catalog> {
  CatalogClient({required String baseUrl})
      : super(
          baseUrl: baseUrl,
          resource: 'catalogs',
          fromJson: (json) => Catalog.fromJson(json),
        );
}

class CatalogController extends ApiController<Catalog, CatalogClient> {
  CatalogController(ProviderRef ref) : super(ref, api.catalog);
}
