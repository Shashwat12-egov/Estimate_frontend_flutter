// import 'package:estimate_flutter/Models/AmountDetails.dart';

class EstimateDetail {
  final String sorId;
  final String name;
  final String category;
  final String description;
  final String uom;

  EstimateDetail({
    required this.sorId,
    required this.name,
    required this.category,
    required this.description,
    required this.uom,
  });

  factory EstimateDetail.fromJson(Map<String, dynamic> json) {
    return EstimateDetail(
      sorId: json['sorId'],
      name: json['name'],
      category: json['category'],
      description: json['description'],
      uom: json['uom'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sorId': sorId,
      'name': name,
      'category': category,
      'description': description,
      // 'unitRate': unitRate,
      // 'noOfunit': noOfunit,
      'uom': uom,
      // 'uomValue': uomValue,
      // 'length': length,
      // 'width': width,
      // 'height': height,
      // 'quantity': quantity,
      // 'isDeduction': isDeduction,
      // 'amountDetail': amountDetail.map((e) => e.toJson()).toList(),
      // 'status': status,
      // 'additionalDetails': additionalDetails,
    };
  }
}
