// import 'package:estimate_flutter/Models/Address.dart';
// import 'package:estimate_flutter/Models/EstimateDetails.dart';

import 'package:estimate_flutter/Models/Address.dart';
import 'package:estimate_flutter/Models/EstimateDetails.dart';

class Estimate {
  final String? tenantId;
  final String? revisionNumber;
  final String? businessService;
  final String? name;
  final String? referenceNumber;
  // final String? projectId;
  // int? proposalDate;
  // final String? status;
  // final String? wfStatus;
  // final String? description;
  // final String? executingDepartment;
  Address? address;
  List<EstimateDetail>? estimateDetails;

  Estimate({
    this.tenantId,
    this.revisionNumber,
    this.businessService,
    // this.projectId,
    // this.proposalDate,
    // this.status,
    // this.wfStatus,
    this.name,
    this.referenceNumber,
    // this.description,
    // this.executingDepartment,
    this.address,
    required this.estimateDetails,
  });

  factory Estimate.fromJson(Map<String, dynamic> json) {
    return Estimate(
      tenantId: json['tenantId'],
      revisionNumber: json['revisionNumber'],
      businessService: json['businessService'],
      name: json['name'],
      referenceNumber: json['referenceNumber'],
      estimateDetails: []
    );
  }

  dynamic toJson() {
    return {
     'tenantId': tenantId,
      'revisionNumber': revisionNumber,
      'businessService': businessService,
      // 'projectId': projectId,
      // 'proposalDate': proposalDate,
      // 'status': status,
      // 'wfStatus': wfStatus,
      'name': name,
      'referenceNumber': referenceNumber,
      // 'description': description,
      // 'executingDepartment': executingDepartment,
      'address': address?.toJson(),
      'estimateDetails': estimateDetails?.map((e) => e.toJson()).toList(),
    };
  }
}