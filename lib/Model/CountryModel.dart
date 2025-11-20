class Country {
  String? name;
  String? capital;
  String? region;
  String? flag;

  Country({
    this.name,
    this.capital,
    this.region,
    this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] ?? 'Desconocido',
      capital: json['capital'] ?? 'Sin capital',
      region: json['region'] ?? 'Sin región',
      flag: json['flags']['png']?? '',
    );
  }
}
