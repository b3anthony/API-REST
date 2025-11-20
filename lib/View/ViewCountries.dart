import 'package:flutter/material.dart';
import 'package:flutter_application_2/Servicios/CountryService.dart';
import 'package:flutter_application_2/Model/CountryModel.dart';
import 'package:flutter_application_2/View/ViewCountryDetails.dart';

class ViewCountries extends StatefulWidget {
  const ViewCountries({super.key});

  @override
  State<ViewCountries> createState() => _ViewCountriesState();
}

class _ViewCountriesState extends State<ViewCountries> {
  final CountryService api = CountryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Text("Lista de Países"),
        backgroundColor: Color(0xFF2D2D30),
        foregroundColor: Color(0xFFE5E5E5),
        elevation: 0,
      ),
      body: FutureBuilder<List<Country>>(
        future: api.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(color: Color(0xFFE5E5E5)),
              ),
            );
          }
          final countries = snapshot.data ?? [];
          return ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return Card(
                color: Color(0xFF2D2D30),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: country.flag != null
                      ? Image.network(
                          country.flag!,
                          width: 50,
                          height: 30,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.flag);
                          },
                        )
                      : Icon(Icons.flag),
                  title: Text(
                    country.name ?? "Sin nombre",
                    style: TextStyle(color: Color(0xFFE5E5E5)),
                  ),
                  subtitle: Text(
                    "Capital: ${country.capital ?? 'N/A'}\nRegión: ${country.region ?? 'N/A'}",
                    style: TextStyle(color: Color(0xFFB0B0B0)),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewCountryDetails(country: country),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
