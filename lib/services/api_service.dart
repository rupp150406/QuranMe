import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah.dart';
import '../models/doa.dart';

class ApiService {
  static const String baseUrlQuran = 'https://quran-api.santrikoding.com/api';
  static const String baseUrlDoa = 'https://open-api.my.id/api';

  Future<List<Surah>> getSurahs() async {
    final response = await http.get(Uri.parse('$baseUrlQuran/surah'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load surahs');
    }
  }

  Future<List<Doa>> getDoas() async {
    final response = await http.get(Uri.parse('$baseUrlDoa/doa'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Doa.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load doas');
    }
  }

  Future<Surah> getSurahDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrlQuran/surah/$id'));

    if (response.statusCode == 200) {
      return Surah.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load surah detail');
    }
  }

  Future<Doa> getDoaDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrlDoa/doa/$id'));

    if (response.statusCode == 200) {
      return Doa.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load doa detail');
    }
  }
}
