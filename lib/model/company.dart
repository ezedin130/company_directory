class Company {
  final int id;
  final String name;
  final String address;
  final String zip;
  final String country;
  final int employeeCount;
  final String industry;
  final int marketCap;
  final String domain;
  final String logo;
  final String ceoName;

  Company({
    required this.id,
    required this.name,
    required this.address,
    required this.zip,
    required this.country,
    required this.employeeCount,
    required this.industry,
    required this.marketCap,
    required this.domain,
    required this.logo,
    required this.ceoName,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['address'] as String,
      zip: json['zip'] as String,
      country: json['country'] as String,
      employeeCount: json['employeeCount'] as int,
      industry: json['industry'] as String,
      marketCap: json['marketCap'] as int,
      domain: json['domain'] as String,
      logo: json['logo'] as String,
      ceoName: json['ceoName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'zip': zip,
      'country': country,
      'employeeCount': employeeCount,
      'industry': industry,
      'marketCap': marketCap,
      'domain': domain,
      'logo': logo,
      'ceoName': ceoName,
    };
  }
}
