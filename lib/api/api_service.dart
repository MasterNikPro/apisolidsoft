
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/image_model.dart';
import 'api_constants.dart';

class ApiService {
  Future<List<ImageModel>?> getImage() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl+ApiConstants.imageEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ImageModel> model = imageModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
