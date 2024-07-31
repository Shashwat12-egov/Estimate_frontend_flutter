// import 'package:estimate_flutter/Models/Boundary.dart';

class Address {
  final String? tenantId;
  final String? doorNo;
  final String? addressLine1;
  final String? addressLine2;
  final String? city;

  Address({
    this.tenantId,
    this.doorNo,
    this.addressLine1,
    this.addressLine2,
    this.city,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      tenantId: json['tenantId'],
      doorNo: json['doorNo'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      // landmark: json['landmark'],
      city: json['city'],
      // pincode: json['pincode'],
      // detail: json['detail'],
      // buildingName: json['buildingName'],
      // street: json['street'],
      // boundary: Boundary.fromJson(json['boundary']),
      // boundaryType: json['boundaryType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tenantId': tenantId,
      'doorNo': doorNo,
      // 'latitude': latitude,
      // 'longitude': longitude,
      // 'addressId': addressId,
      // 'addressNumber': addressNumber,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      // 'landmark': landmark,
      'city': city,
      // 'pincode': pincode,
      // 'detail': detail,
      // 'buildingName': buildingName,
      // 'street': street,
      // 'boundary': boundary.toJson(),
      // 'boundaryType': boundaryType,
    };
  }
}