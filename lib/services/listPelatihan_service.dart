import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_smarcerti/app/data/models/listPelatihan_model.dart';

class PelatihanService {
  // Fungsi untuk mengambil data pelatihan dari API
  static Future<List<Pelatihan>> fetchPelatihanList() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/pelatihan'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Pelatihan.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load pelatihan data');
    }
  }
}
