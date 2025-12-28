import 'dart:convert';
import 'package:company_directory/model/company.dart';
import 'package:http/http.dart' as http;

class CompanyService {
  final String _baseUrl = 'https://fake-json-api.mock.beeceptor.com/companies';

  Future<List<Company>> fetchCompanies() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Company.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch companies');
    }
  }
}
