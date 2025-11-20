import 'dart:convert';
import 'package:flutter_application_2/Model/CountryModel.dart';
import 'package:http/http.dart' as http;

class CountryService {
  final String _baseUrl = "https://www.apicountries.com";

  Future<List<Country>> getCountries() async {
    final url = Uri.parse("$_baseUrl/countries");
    List<Country> countryList = [];
    
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      for (var item in jsonList) {
        Country country = Country.fromJson(item);
        countryList.add(country);
      }
      return countryList;
    } else {
      throw Exception("Error al obtener países");
    }
  }
}
