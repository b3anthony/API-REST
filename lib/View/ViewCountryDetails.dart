import 'package:flutter/material.dart';
import 'package:flutter_application_2/Model/CountryModel.dart';

class ViewCountryDetails extends StatelessWidget {
  final Country country;

  const ViewCountryDetails({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF2D2D30),
        title: Text(
          country.name ?? "Detalles del País",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header con bandera grande
            Container(
              width: double.infinity,
              height: 250,
              color: Color(0xFF2D2D30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color(0xFF252526),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: country.flag != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              country.flag!,
                              width: 200,
                              height: 133,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 200,
                                  height: 133,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Icons.flag,
                                    size: 60,
                                    color: Colors.grey[600],
                                  ),
                                );
                              },
                            ),
                          )
                        : Container(
                            width: 200,
                            height: 133,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.flag,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                          ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    country.name ?? "Sin nombre",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Color(0xFFE5E5E5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Información detallada
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  // Card de información general
                  _buildInfoCard(
                    icon: Icons.location_city,
                    iconColor: Color(0xFF6C63FF),
                    title: "Capital",
                    value: country.capital ?? "No disponible",
                  ),
                  SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.public,
                    iconColor: Color(0xFF48BB78),
                    title: "Región",
                    value: country.region ?? "No disponible",
                  ),
                  SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.info_outline,
                    iconColor: Color(0xFFED8936),
                    title: "Nombre Completo",
                    value: country.name ?? "No disponible",
                  ),

                  SizedBox(height: 40),

                  // Botón de regreso estilizado
                  Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        colors: [Color(0xFF3C3C3C), Color(0xFF2D2D30)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF667EEA).withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back, size: 24, color: Color(0xFFE5E5E5)),
                          SizedBox(width: 8),
                          Text(
                            "Volver a la lista",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2D2D30),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 28,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xFF808080),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFFE5E5E5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
