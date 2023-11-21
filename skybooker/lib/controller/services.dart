import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:skybooker/model/travel_model.dart';

class Api {
  static const baseUrl = "https://skybooker.vercel.app/api/";

  // Create method
  static addTravel(Map travelData) async {
    var url = Uri.parse("${baseUrl}add_travel");
    try {
      final res = await http.post(url, body: travelData);
      if (res.statusCode == 200) {
        // Se a requisição der certo
        var data = jsonDecode(res.body.toString());
        debugPrint(data);
      } else {
        // Se der errado
        debugPrint("Failed to get response");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // Get method
  static getTravel() async {
    List<Travel> travels = [];

    var url = Uri.parse("${baseUrl}get_travel");
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        if (data is List) {
          travels = data
              .map((value) => Travel(
                    id: value['_id'].toString(),
                    destiny: value['travelDestiny'],
                    description: value['travelDescription'],
                    price: value['travelPrice'] ?? '',
                  ))
              .toList();

          return travels;
        } else {
          debugPrint("Invalid response format");
          return [];
        }
      } else {
        debugPrint("Failed to get response");
        return [];
      }
    } catch (error) {
      debugPrint(error.toString());
      return [];
    }
  }

  // Update put method
  static updateTravel(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    try {
      final res = await http.put(url, body: body);
      
      if (res.statusCode == 200) {
        debugPrint(jsonDecode(res.body));
      } else {
        debugPrint("Failed to update data");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  // Delete method
  static deleteTravel(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");
    try {
      final res = await http.delete(url);
      if (res.statusCode == 200) {
        debugPrint(jsonDecode(res.body));
      } else {
        debugPrint("Failed to delete data");
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
