class Address {
  int addressId;
  String street;
  int streetNumber;
  String city;
  String country;

  Address({
    required this.addressId,
    required this.street,
    required this.streetNumber,
    required this.city,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      addressId: json['address_id'] as int,
      street: json['street'] as String,
      streetNumber: json['street_number'] as int,
      city: json['city'] as String,
      country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'street': street,
      'street_number': streetNumber,
      'city': city,
      'country': country,
    };
  }
}
