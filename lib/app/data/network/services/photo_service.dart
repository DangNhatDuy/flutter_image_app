import 'dart:convert';
import '../constants/endpoints.dart';
import './../../models/photo.dart';
import '../base_client.dart';

class PhotoService {
  final BaseClient _client;

  PhotoService(this._client);

  Future<List<PhotoReponse>> getListPhotos({int page = 1}) async {
    var api =
        '${Endpoints.listPhotos}/?client_id=eCd0kgNiYrT5_GtU1bJnq2_hNksPc51idFo_QTxi5Gs&page=$page&per_page=18';
    var response = await _client.get(api);
    var list = json.decode(response) as List;
    return (list).map((e) => PhotoReponse.fromJson(e)).toList();
  }
}
